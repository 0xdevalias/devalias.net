# devalias.net

[![StackShare](https://img.shields.io/badge/tech-stack-0690fa.svg?style=flat)](https://stackshare.io/devalias/devalias-net)

This is the [Jekyll](https://jekyllrb.com/) source for http://www.devalias.net/

Feel free to create an issue/pull request for any typo's/bugs you might find :) <3

## Cheatsheet

* Link to other posts
    * `[other post]({% post_url 2017-01-01-other-post %})`
* Embed an image with [jekyll-postfiles](https://github.com/nhoizey/jekyll-postfiles#how-does-it-work)
  * create a folder under `_posts` named the same as your post's markdown file
  * add any images for your post there, along with the post's markdown file
  * use a relative markdown image tag to reference and embed the images
    * eg. `![a title or something](foo.jpg)`
* Embed a gist with [jekyll-gist](https://github.com/jekyll/jekyll-gist)
    * `{% gist foo/12345678901234567890 %} `
* Embed a tweet with [jekyll-twitter-plugin](https://github.com/rob-murray/jekyll-twitter-plugin)
    * `{% twitter https://twitter.com/rubygems/status/518821243320287232 %}`
