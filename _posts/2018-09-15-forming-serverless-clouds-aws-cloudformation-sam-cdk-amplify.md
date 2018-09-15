---
layout: post
title: "Forming Serverless Clouds with AWS: CloudFormation, SAM, CDK, Amplify"
tags:
- dev
- infrastructure
- automation
- serverless
- cloud
- aws
- amazon
- cloudformation
- sam
- cdk
- amplify
- golang
- react
- graphql
- boilerplate
- generator
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: true
crossposted:
- https://medium.com/@devalias/forming-serverless-clouds-with-aws-cloudformation-sam-cdk-amplify-bd8bb0b00e5a
- https://www.linkedin.com/pulse/forming-serverless-clouds-aws-cloudformation-sam-cdk-amplify-grant/
- https://twitter.com/_devalias/status/1040880037015089152
---
Recently I have been playing around with a few little side projects, and trying out different ways of getting them IntoTheCloud(tm). If you know me, you know that I'm pretty big on increasing efficiency, reducing boilerplate/time to start, automation, infrastructure as code (IaC), and similar fun things.

With these explorations I have been looking to see how I can go from 'cool project idea' to having a PoC [serverless](https://aws.amazon.com/serverless/) application running InTheCloud(tm) with as little time, effort, boilerplate, and ongoing cost required; with the hope that if it is quick/easy enough, and the patterns simple enough, I will actually get around to hacking on more of my side projects (or it will be quicker and cheaper to get clients projects up and running).

## <a name="aws"></a>AWS

For this particular exploration I have been playing around a lot in [AWS](https://aws.amazon.com/) (Amazon's Cloud), with a particular focus on [serverless](https://aws.amazon.com/serverless/) patterns. As you probably know, AWS is huge, basically runs a good chunk of the internet, and seemingly [has a product line for every possible thing you could dream of](https://aws.amazon.com/products/).

Since I was looking to speed up my 'new project boilerplate', I decided to focus in on the following projects/services:

* [AWS CloudFormation](https://aws.amazon.com/cloudformation/) ([see below](#cloudformation))
* [AWS Serverless Application Model (SAM)](https://github.com/awslabs/serverless-application-model) ([see below](#sam))
* [AWS Cloud Development Kit (CDK)](https://github.com/awslabs/aws-cdk) ([see below](#cdk))
* [AWS Amplify](https://aws-amplify.github.io/) ([see below](#amplify))

I'll go into a bit more detail on each of these below, but since I saw so much potential crossover/overlap between them, I opened a few issues on their respective repositories. You might find more interesting tips, tricks, and aspects in those threads too:

* [awslabs/aws-sam-cli#663](https://github.com/awslabs/aws-sam-cli/issues/663)
* [awslabs/aws-cdk#703](https://github.com/awslabs/aws-cdk/issues/703)
* [aws-amplify/amplify-cli#160](https://github.com/aws-amplify/amplify-cli/issues/160)

## <a name="cloudformation"></a>AWS CloudFormation

> [AWS CloudFormation](https://aws.amazon.com/cloudformation/) provides a common language for you to describe and provision all the infrastructure resources in your cloud environment. CloudFormation allows you to use a simple text file to model and provision, in an automated and secure manner, all the resources needed for your applications across all regions and accounts. This file serves as the single source of truth for your cloud environment.

Basically, [CloudFormation](https://aws.amazon.com/cloudformation/) is a bunch of JSON or YAML that defines all of the AWS resources/projects you want to use, how to configure them, and how to tie it all together. Then you can just push it ToTheCloud(tm), some kind of magic happens while you go make coffee, and you're done. It's AWS's basic Infrastructure as Code (IaC) service.

In reality, CloudFormation templates can VERY quickly get massively out of hand, huge, confusing, and pretty hard to cognitively reason about. It's great as an underlying technology layer.. but it isn't really optimised for human consumption (particularly the JSON format). Thankfully some of the other projects I will talk about a little later aim to solve that human interface problem.

Within CloudFormation there are a few high level concepts that it's good to be aware of:

* [Stack](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html): This ties together all of your resources in an [AWS Region](https://docs.aws.amazon.com/general/latest/gr/rande.html) into a single unit.
* [Nested Stack](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html): A stack created within another stack. Allows you to seperate common patterns into their own templates and tie them all together.
* [StackSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/what-is-cfnstacksets.html): This ties together multiple Stacks, and allows you to manage them across multiple regions and accounts.

Since Stacks by themselves are single region, you can run into some weird problems depending on the services you want to use. For example, when I want to deploy my application in `ap-southeast-2`, but want to use [AWS CloudFront](https://aws.amazon.com/cloudfront/) ([which runs in `us-east-1`](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cnames-and-https-requirements.html#https-requirements-aws-region)) with a HTTPS certificate issued through [AWS Certificate Manager](https://aws.amazon.com/certificate-manager/), I can't natively do this within a single stack.

There are workarounds such as [using custom resources](https://github.com/awslabs/serverless-application-model/issues/565#issuecomment-419129580) to manage the deployment, or [using a StackSet](https://github.com/awslabs/serverless-application-model/issues/565#issuecomment-419608229) with [exported outputs](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/outputs-section-structure.html) and [`Fn::ImportValue`](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html) to deploy the related components across different regions; but sometimes it can take a little digging to figure out the best way to do it.

If you're interested in trying the [Custom Resource](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-custom-resources.html) approach, the following was how one person explained their implementation to me:

> It's a bit complicated due to specifics of ACM certificate issuance. The general way it works is:
>
> * CloudFormation creates a custom resource that has the same "signature" as an ACM certificate. It takes the same parameters and has the same return values (Ref and attribute values).
>
> * The custom resource invokes a Lambda function in the account. This function requests a new certificate from ACM in us-east-1.
>
> * The Lambda function then sends a message to an SQS queue in the account. This queue is subscribed by the same Lambda function. The queue is effectively a "while" loop to reinvoke the function every 30 seconds to check whether the certificate has been issued.
>
> * Every time the Lambda function is invoked by the queued message:
>   * If the certificate has been issued, the function responds with a success back to CloudFormation with the appropriate return values. The function returns successfully, which removes the message from the SQS queue.
>   * If the certificate issuance failed, the function responds with a failure back to CloudFormation with an appropriate message. The function returns successfully, which removes the message from the SQS queue.
>   * If the certificate is still awaiting verification, the function does nothing and throws an error. The error causes SQS to keep the message in the queue and retry 30 seconds later.
>
> * Meanwhile, the ACM certificate verification occurs (a human approves it via an email sent to the domain owner, or a DNS record is added to the domain to verify the certificate).

While it is pretty convoluted setup for a single project, I expect that if designed well this could be wrapped up into a simple open source/deployable component that everyone could make use of rather easily. Perhaps something for the [AWS Serverless Application Repository](https://aws.amazon.com/serverless/serverlessrepo/) or as a [Launch Stack Button](https://aws.amazon.com/blogs/devops/construct-your-own-launch-stack-url/)?

## <a name="sam"></a>AWS Severless Application Model (SAM)

> The [AWS Serverless Application Model (AWS SAM)](https://docs.aws.amazon.com/lambda/latest/dg/serverless_app.html) is a model to define serverless applications. AWS SAM is natively supported by AWS CloudFormation and defines simplified syntax for expressing serverless resources. The specification currently covers APIs, Lambda functions and Amazon DynamoDB tables.

AWS SAM ([GitHub](https://github.com/awslabs/serverless-application-model), [Spec/Usage](https://github.com/awslabs/serverless-application-model/blob/master/versions/2016-10-31.md), [Examples](https://github.com/awslabs/serverless-application-model/tree/master/examples), [Site](https://awslabs.github.io/serverless-application-model/), [CLI](https://github.com/awslabs/aws-sam-cli), [Templates](https://github.com/awslabs/aws-sam-cli/tree/master/samcli/local/init/templates)) seems to have come about because using CloudFormation directly was just too verbose and time consuming for some of the more common serverless usecases. By wrapping these cases up in a simplified/abstracted way makes it easier to get started, and therefore more likely for people to use the serverless resources AWS provides. It similarly follows the CloudFormation model of defining your resources in YAML, and uses a [translator](https://pypi.org/project/aws-sam-translator/) ([GitHub](https://github.com/awslabs/serverless-application-model/tree/master/samtranslator)) to build the raw underlying CloudFormation template.

While AWS SAM seems great for these common usecases, there are definitely areas where you will need to fall back to using native CloudFormation (which you can thankfully use directly within a SAM template). There are also a number of areas where limitations in what SAM allows you to configure means [you may not be able to use it's simplified abstractions](https://github.com/awslabs/serverless-application-model/issues/566#issuecomment-419311289). These are likely to improve over time as [people run into the issues](https://github.com/awslabs/serverless-application-model/issues), and the maintainer team implements/improves features.

What is really nice is just how simple it is to get a new project off the ground:

* Have a look at [Get Started](https://github.com/awslabs/aws-sam-cli#get-started) and [install/upgrade the CLI](https://github.com/awslabs/aws-sam-cli/blob/develop/docs/installation.rst#using-pip): `pip install --upgrade aws-sam-cli`
* [Init your new application](https://github.com/awslabs/aws-sam-cli/blob/develop/docs/usage.rst): `sam init --runtime nodejs8.10 --name foo-app`
  * There are MANY supported runtimes (`sam init --help`).. so choose your favourite: `[python3.6|python2.7|python|nodejs6.10|nodejs8.10|nodejs4.3|nodejs|dotnetcore2.0|dotnetcore1.0|dotnetcore|dotnet|go1.x|go|java8|java]`
* Pull down your app dependencies: `cd foo-app/hello_world && npm install`
* Run your API locally (`sam local --help`): `cd ../ && sam local start-api`
* View your application in all of it's glory: http://127.0.0.1:3000/hello

<a name="sam-example"></a>If you have a look at the generated SAM template (`template.yaml`), you'll see that the entire stack is only ~45 lines (including newlines and comments), with the main function code only taking up ~15 lines. Not bad to get a PoC application running:

```yaml
HelloWorldFunction:
  Type: AWS::Serverless::Function
  Properties:
    CodeUri: hello_world/
    Handler: app.lambdaHandler
    Runtime: nodejs8.10
    Environment:
      Variables:
        PARAM1: VALUE
    Events:
      HelloWorld:
        Type: Api
        Properties:
          Path: /hello
          Method: get
```

Once we're ready to [deploy this to the cloud](https://github.com/awslabs/aws-sam-cli/blob/develop/docs/deploying_serverless_applications.rst), we have just a couple more commands to run:

* Make sure our template is valid: `sam validate`
* Package any external code and upload to S3 (bucket must already exist): `sam package --template-file ./template.yaml --output-template-file ./packaged.yaml --s3-bucket FOO-PKGS-BUCKET`
* Deploy our stack: `sam deploy --template-file ./packaged.yaml --stack-name Foo-App --capabilities CAPABILITY_IAM`

Now if you're like me and enjoy writing your backend in [Golang](https://golang.org/), then you may find the default template (`sam init --runtime go1.x --name foo-app`) a little lacking (eg. no [`dep`](https://github.com/golang/dep), basic Makefile, etc). Thankfully we have the ability to pass a `--location` flag to tell it to use a different template project.

But how do we know what the template project should look like? Digging into the code we find the [`generate_project`](https://github.com/awslabs/aws-sam-cli/blob/6164d6d2e7351a849ad3d79973ac18b8d3d1d371/samcli/local/init/__init__.py#L35) function, which accepts the `location` parameter. [If the parameter is defined it will be used](https://github.com/awslabs/aws-sam-cli/blob/6164d6d2e7351a849ad3d79973ac18b8d3d1d371/samcli/local/init/__init__.py#L68), otherwise it is looked up in the [`RUNTIME_TEMPLATE_MAPPING`](https://github.com/awslabs/aws-sam-cli/blob/6164d6d2e7351a849ad3d79973ac18b8d3d1d371/samcli/local/init/__init__.py#L16-L32), which links the runtime you specified (eg. `go1.x`) to the template project to use (eg. [`cookiecutter-aws-sam-hello-golang`](https://github.com/awslabs/aws-sam-cli/blob/6164d6d2e7351a849ad3d79973ac18b8d3d1d371/samcli/local/init/__init__.py#L28)). These templates are looked up in the [`_templates` variable path](https://github.com/awslabs/aws-sam-cli/blob/6164d6d2e7351a849ad3d79973ac18b8d3d1d371/samcli/local/init/__init__.py#L13-L14), which after some digging I managed to [locate in the repo at `aws-sam-cli/samcli/local/init/templates/`](https://github.com/awslabs/aws-sam-cli/tree/6164d6d2e7351a849ad3d79973ac18b8d3d1d371/samcli/local/init/templates). There also appear to be a few more templates on the [aws-samples GitHub](https://github.com/aws-samples?utf8=%E2%9C%93&q=cookiecutter&type=&language=).

Having a look at the [Golang template project](https://github.com/awslabs/aws-sam-cli/tree/6164d6d2e7351a849ad3d79973ac18b8d3d1d371/samcli/local/init/templates/cookiecutter-aws-sam-hello-golang), it appears that these are [Cookiecutter](https://github.com/audreyr/cookiecutter) ([docs](https://cookiecutter.readthedocs.io/en/latest/)) templates. So to make our own customised SAM Golang starter template, after [installing Cookiecutter](https://cookiecutter.readthedocs.io/en/latest/installation.html#install-cookiecutter) (`pip install --upgrade cookiecutter`), we can copy the [existing template](https://github.com/awslabs/aws-sam-cli/tree/master/samcli/local/init/templates/cookiecutter-aws-sam-hello-golang), [make our desired changes](https://cookiecutter.readthedocs.io/en/latest/usage.html#make-your-changes), and save it somewhere useful for future use (such as GitHub). Then when we want to use it in a new project:

* `sam init --runtime go1.x --location gh:0xdevalias/TODO-cookiecutter-aws-sam-golang --name foo-app`

While I haven't abstracted out my patterns into a custom starter template yet, this may be something I end up doing in future, so make sure to [keep an eye on my GitHub](https://github.com/0xdevalias?utf8=%E2%9C%93&tab=repositories&q=cookiecutter-&type=&language=).

## <a name="cdk"></a>AWS Cloud Development Kit (CDK)

> The [AWS Cloud Development Kit (AWS CDK)](https://github.com/awslabs/aws-cdk) is an open-source software development framework to define cloud infrastructure in code and provision it through AWS CloudFormation. The CDK integrates fully with AWS services and offers a higher level object-oriented abstraction to define AWS resources imperatively. Using the CDK’s library of infrastructure constructs, you can easily encapsulate AWS best practices in your infrastructure definition and share it without worrying about boilerplate logic. The CDK improves the end-to-end development experience because you get to use the power of modern programming languages to define your AWS infrastructure in a predictable and efficient manner. The CDK is currently available for Java, JavaScript, and TypeScript.

AWS CDK ([GitHub](https://github.com/awslabs/aws-cdk), [Changelog](https://github.com/awslabs/aws-cdk/blob/master/CHANGELOG.md), [Site](https://awslabs.github.io/aws-cdk/), [Reference](https://awslabs.github.io/aws-cdk/reference.html), Examples: [1](https://awslabs.github.io/aws-cdk/examples.html), [2](https://github.com/awslabs/aws-cdk/tree/master/examples)) moves away from directly constructing raw YAML/JSON by hand, and takes more of a 'generator code' approach, providing a development kit of libraries that you can use to describe how your cloud infrastructure should look, connect, and interact. Once it's all defined in code, you can use it to generate the CloudFormation / [AWS SAM](https://awslabs.github.io/aws-cdk/refs/_aws-cdk_aws-sam.html) YAML, deploy it to the cloud, and everything else you would come to expect from these sorts of tools.

The CDK is divided up into a number of libraries, with [each representing an AWS service](https://awslabs.github.io/aws-cdk/reference.html). Each of these libraries is broken up into two different levels of [Constructs](https://awslabs.github.io/aws-cdk/constructs.html):

* [CloudFormation Resource](https://awslabs.github.io/aws-cdk/cloudformation.html): low-level constructs that provide a direct, one-to-one, mapping to an AWS CloudFormation resource, as listed in the [AWS CloudFormation Resource Types Reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html).
* [AWS Construct Library](https://awslabs.github.io/aws-cdk/aws-construct-lib.html): handwritten by AWS and come with convenient defaults and additional knowledge about the inner workings of the AWS resources they represent. In general, you will be able to express your intent without worrying about the details too much, and the correct resources will automatically be defined for you.

Where possible you should be able to use the higher level constructs to get things done (and these will only get better over time), but it's nice to know that we have an easy way to drop down to the lower-level functionality when we need to. There also appears to be the ability to create new Construct libs (`cdk init --list`, [template](https://github.com/awslabs/aws-cdk/tree/master/packages/aws-cdk/lib/init-templates/lib)), so it's possible you could build your own custom construct abstractions with this. Another area for future exploration.

As is pretty standard by now, you define a [stack](https://awslabs.github.io/aws-cdk/stacks.html) which contains all of the features and services you want to use, then configure the [environment](https://awslabs.github.io/aws-cdk/environments.html#environments) to define where it should be deployed. You can define multiple stacks within your [CDK App](https://awslabs.github.io/aws-cdk/apps.html), which means we have a nice way to handle cross-region deployments. There is built in support for uploading [assets](https://awslabs.github.io/aws-cdk/assets.html) ([ref](https://awslabs.github.io/aws-cdk/refs/_aws-cdk_assets.html#id2)) that your application may require (eg. lambda code, etc), as well as [applets](https://awslabs.github.io/aws-cdk/applets.html) for running custom code as part of your build (eg. compiling code/assets).

[Getting started](https://awslabs.github.io/aws-cdk/getting-started.html) with a new project is pretty simple (note: if you don't have default creds configured, make sure to use `AWS_PROFILE`/`--profile` [or things will hang](https://github.com/awslabs/aws-cdk/issues/130#issuecomment-421508274)):

* [Install the CDK CLI](https://awslabs.github.io/aws-cdk/getting-started.html#install-the-command-line-toolkit): `npm install -g aws-cdk`
* Check what templates/languages are available: `cdk init --list`
* Init a new app: `mkdir foo && cd foo && cdk init app --language=typescript`
* [Compile CDK App Typescript](https://awslabs.github.io/aws-cdk/getting-started.html#compile-the-code): `npm run build` (or `npm run watch` in another terminal)
* [List the stacks](https://awslabs.github.io/aws-cdk/getting-started.html#list-the-stacks-in-the-app): `cdk ls --long`
* [Synthesize the code to CloudFormation YAML](https://awslabs.github.io/aws-cdk/getting-started.html#synthesize-an-cfn-template): `cdk synth` or `cdk synth FooStack`

When you're happy and think you're ready to deploy:

* [Diff to see changes](https://awslabs.github.io/aws-cdk/getting-started.html#preparing-for-deployment) (and make sure you're still happy): `cdk diff`
* [Deploy](https://awslabs.github.io/aws-cdk/getting-started.html#deploying-the-stack): `cdk deploy`

Following along from our previous [AWS SAM example](#sam-example), we can create an equivalent [example SAM function](https://github.com/awslabs/aws-cdk/issues/716) ([ref](https://awslabs.github.io/aws-cdk/refs/_aws-cdk_aws-sam.html)) in `./bin/foo.ts` with code such as the following:

```typescript
import sam = require('@aws-cdk/aws-serverless');
import lambda = require('@aws-cdk/aws-lambda');
```

```typescript
const helloWorld = new sam.cloudformation.FunctionResource(this, "HelloWorldFunction", {
  codeUri: "hello_world/",
  handler: "app.lambdaHandler",
  runtime: lambda.Runtime.NodeJS810.name,
  environment: {
    variables: {
      PARAM1: "VALUE"
    }
  },
  events: {
    HelloWorld: {
      type: "Api",
      properties: {
        path: "/hello",
        method: "get",
      }
    }
  }
});
```

Remember you will need to `npm install` any additional packages you need before you can use them:

```
npm i @aws-cdk/aws-serverless @aws-cdk/aws-lambda
```

Once we compile (`npm run build`) and synthesize (`cdk synth`), we can see we end up with equivalent YAML to our [previous SAM example](#sam-example):

```yaml
HelloWorldFunction:
  Type: 'AWS::Serverless::Function'
  Properties:
    CodeUri: hello_world/
    Handler: app.lambdaHandler
    Runtime: nodejs8.10
    Environment:
      Variables:
        PARAM1: VALUE
    Events:
      HelloWorld:
        Properties:
          Method: get
          Path: /hello
        Type: Api
```

While CDK is [quite a new project (Aug 2018)](https://aws.amazon.com/blogs/developer/aws-cdk-developer-preview/), we can already see that it is quite powerful to work with.

## <a name="amplify"></a>Amplify

> [Amplify](https://aws-amplify.github.io/) is an open source project which is focused on mobile and web developers building applications. This consists of a library, UI components, and a CLI toolchain. The design follows a category based model allowing developers to perform advanced use cases with declarative client APIs so that they can focus on their application code (e.g. Auth.signIn() or API.graphql()). This allows developers to focus on their business use cases and less time on re-implementing the most common use cases around mobile or web app development (Auth flows, Storage and API interaction, Analytics, etc.) ([Source](https://github.com/aws-amplify/amplify-cli/issues/160#issuecomment-421100213))

[AWS Amplify](https://aws-amplify.github.io/) ([GitHub](https://github.com/aws-amplify)) combines a number of different complementary aspects to simplify modern mobile and web development:

* [CLI](https://github.com/aws-amplify/amplify-cli): uses AWS CloudFormation and nested stacks to define and provision commonly required backend services and features
* Library / [UI Components](https://aws-amplify.github.io/media/ui_library): These appear to be broken down based on platform
  * [Web / JavaScript / React Native](https://aws-amplify.github.io/amplify-js/media/quick_start?platform=react) ([GitHub](https://github.com/aws-amplify/amplify-js))
  * [iOS](https://docs.aws.amazon.com/aws-mobile/latest/developerguide/getting-started.html#ios-swift)
  * [Android](https://docs.aws.amazon.com/aws-mobile/latest/developerguide/getting-started.html#android-java)

Of all of the projects I have explored today, this is the one I have the least experience with, so I may not have fully come to understand/appreciate the depth of it yet. In a bit of a difference from the previous projects, this seems to take more of a 'full-stack' approach to solving common application needs.

One of the nice things about the [Amplify CLI](https://github.com/aws-amplify/amplify-cli) is how it aims to provide simple menu-driven options for getting everything going:

* [Install the CLI](https://github.com/aws-amplify/amplify-cli#install-the-cli): `npm install -g @aws-amplify/cli`
* Init a new project: `amplify init` and follow the menu choices

```
⇒  amplify init
Note: It is recommended to run this command from the root of your app directory
? Choose your default editor: None
? Choose the type of app that you're building: javascript
Please tell us about your project
? What javascript framework are you using: react
? Source Directory Path:  src
? Distribution Directory Path: build
? Build Command:  npm run-script build
? Start Command: npm run-script start

Using default provider awscloudformation

Initializing project in the cloud...
..snip..
Your project has been successfully initialized and connected to the cloud!
```

* Choose a category (feature) you want to add (`amplify --help`), and select it: eg. `amplify function add`

```
⇒  amplify function add
Using service: Lambda, provided by: awscloudformation
? Provide a friendly name for your resource to be used as a label for this category in the project: HelloWorld
? Provide the AWS Lambda function name: HelloWorld
? Choose the function template that you want to use: Serverless express function (Integration with Amazon API Gateway)
? Do you want to edit the local lambda function now? false
Successfully added resource HelloWorld locally.
```

At this point you should be able to see the generated files in `./amplify/backend/function/HelloWorld`. Of particular note is the generated CloudFormation JSON (`HelloWorld-cloudformation-template.json`). While it is nice that it is automatically generated, using the JSON form, and not appearing to leverage SAM means that it ends up being quite a verbose file to cognitively reason about. I believe the intention is that you don't modify this directly (and I read somewhere that even if you do it may be overwritten?). If nothing else, it serves as a decent reference implementation for this kind of feature, that you could then translate back to your preferred method (eg. SAM/CDK).

Digging into the source, it appears these templates are located within the [specific subpackage](amplify-category-function) of the CLI, in the [cloudformation provider](https://github.com/aws-amplify/amplify-cli/tree/master/packages/amplify-category-function/provider-utils/awscloudformation) (eg. [the function template used above](https://github.com/aws-amplify/amplify-cli/blob/master/packages/amplify-category-function/provider-utils/awscloudformation/cloudformation-templates/lambda-cloudformation-template.json.ejs)).

While currently there only appears to be a single 'provider' ([`amplify-provider-awscloudformation`](https://github.com/aws-amplify/amplify-cli/tree/master/packages/amplify-provider-awscloudformation)), language around the websites/repos implies that in future they would like to support additional providers, so it [may be possible to implement CDK](https://github.com/aws-amplify/amplify-cli/issues/171) and/or SAM into this flow, for a 'best of all worlds' situation.

Implementing the most basic use case (`function`) as we did above isn't really where Amplify shines. For example, you can add an [authentication system](https://aws-amplify.github.io/amplify-js/media/authentication_guide) ([JS Ref](https://aws-amplify.github.io/amplify-js/api/classes/authclass.html)) to your backend with just `amplify auth add`, or a new [GraphQL/REST api](https://aws-amplify.github.io/amplify-js/media/api_guide) with `amplify api add`, and similar simplicity for other common features and patterns.

Moving from the backend infrastructure, Amplify also features libraries and UI components to consume these features in your application. For example, getting up and running with React ([1](https://aws-amplify.github.io/amplify-js/media/react_guide), [2](https://aws-amplify.github.io/amplify-js/media/quick_start?platform=react)) can be as simple as:

```
create-react-app my-app
cd my-app
npm install --save aws-amplify
npm install --save aws-amplify-react

amplify init
```

And then a [few little code changes](https://aws-amplify.github.io/amplify-js/media/quick_start#step-4-set-up-your-backend) to wire things into place.

As part of all of this, you get access to the [UI Components](https://aws-amplify.github.io/amplify-js/media/ui_guide), which should dramatically reduce the amount of boilerplate wiring up required to make use of these common application patterns.

I feel like I haven't even begun to dive deep enough into the [frontend JS](https://aws-amplify.github.io/amplify-js/api/)/[UI component libraries](https://aws-amplify.github.io/amplify-js/media/ui_guide) to do them justice, so I will leave that as an excerise to the reader (or a future blog post).

As mentioned in previous sections, this is also quite a new project ([Amplify (Nov 2017)](https://aws.amazon.com/blogs/mobile/announcing-aws-amplify-and-the-aws-mobile-cli/), [CLI (Aug 2018)](https://aws.amazon.com/blogs/mobile/announcing-the-aws-amplify-cli-toolchain/)), so I'm sure things are going to get much better as time goes on.

## <a name="conclusion"></a>Conclusion

We explored a number of different AWS serverless friendly projects and options, and how they may be able to be leveraged together synergistically, or to do similar things as each other. This is still an area I am actively exploring, and a lot of the projects are still quite young, so I'm excited to see what improvements and new efficient patterns come out of this! Maybe I will write a more specific follow up blog at some point detailing how I actually end up using some of these technologies in practice.

## <a name="where-next"></a>Where Next?

You could [learn more about serverless](https://aws.amazon.com/serverless/) and [build a web app](https://aws.amazon.com/serverless/build-a-web-app/), put together a modern frontend with [Create React App](https://github.com/facebook/create-react-app) + [Redux](https://redux.js.org/introduction) + [Redux-Saga](https://redux-saga.js.org/), design a serverless Golang backend with [AWS SDK for Golang](https://aws.amazon.com/sdk-for-go/) + [Gorilla Mux](https://github.com/gorilla/mux) + [AWS Lambda Go Api Proxy](https://github.com/awslabs/aws-lambda-go-api-proxy#other-frameworks), read more about Authentication with [AWS Cognito](https://aws.amazon.com/cognito/), learn about [GraphQL](https://graphql.org/).. so many interesting things out there to learn about and play with!

What are you planning to build? Have any tips or suggestions? A story of how this helped (or hindered) you on a project? I'd love to hear about it in the comments below!
