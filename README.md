# devalias.net

[![StackShare](https://img.shields.io/badge/tech-stack-0690fa.svg?style=flat)](https://stackshare.io/devalias/devalias-net)

This is the [Jekyll](https://jekyllrb.com/) source for http://www.devalias.net/

Feel free to create an issue/pull request for any typo's/bugs you might find :) <3

<!-- TOC start (generated with https://derlin.github.io/bitdowntoc/) -->
- [Quick Start](#quick-start)
- [Managing Posts and Drafts](#managing-posts-and-drafts)
   - [Drafts](#drafts)
   - [Tips and Tricks](#tips-and-tricks)
- [Additional Commands](#additional-commands)
<!-- TOC end -->

## Quick Start

To get started quickly, use the following commands:

- Serve the site locally: `./bin/serve` or `./bin/serve-drafts` (includes drafts)
- Build the site: `./bin/build`
- Deploy the site: `./bin/deploy`

## Managing Posts and Drafts

### Drafts

- Create a new draft: `jekyll draft "Name of Post"`
- Serve drafts locally: `./bin/serve-drafts` or `jekyll serve --incremental --drafts`
- Promote a draft to a published post: `./bin/publish ./_drafts/post-name.md` or `jekyll publish ./_drafts/post-name.md`
  - This will move the specified draft post to the `_posts` directory, making it a published post (though it won't be built or deployed automatically).
- Unpublish a post: `jekyll unpublish ./_posts/post-name.md`
  - This will move the specified post from the `_posts` directory back to the `_drafts` directory, making it a draft again.

### Tips and Tricks

- Link to other posts: `[other post]({% post_url 2017-01-01-other-post %})`
- Embed an image with [jekyll-postfiles](https://github.com/nhoizey/jekyll-postfiles#how-does-it-work)
  - Create a folder under `_posts` named the same as your post's markdown file
  - Add images to that folder and use a relative markdown image tag: `![a title or something](foo.jpg)`
- Embed a gist with [jekyll-gist](https://github.com/jekyll/jekyll-gist): `{% gist foo/12345678901234567890 %}`
- Embed a tweet with [jekyll-twitter-plugin](https://github.com/rob-murray/jekyll-twitter-plugin): `{% twitter https://twitter.com/rubygems/status/518821243320287232 %}`

## Additional Commands

- Check outdated dependencies: `./bin/outdated`
  - This will list all outdated dependencies for your project.
