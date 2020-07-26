source 'https://rubygems.org'

gem 'jekyll','~>4.1.0'

# LSI (related posts)
# Note: You need to install one of nmatrix or narray first, and export NMATRIX=1 or NARRAY=1 before running bundle install
# otherwise gsl won't use them. Note that you can only use one or the other, not both.
#   see https://github.com/SciRuby/rb-gsl#nmatrix-and-narray-usage
#
# Both of these seem to be extremely outdated, see:
#   https://github.com/0xdevalias/devalias.net/issues/83
#   https://github.com/jekyll/classifier-reborn/issues/192
#   https://github.com/SciRuby/rb-gsl/issues/63
#gem 'nmatrix'
gem 'gsl' # Note: you need to install a compatible version (eg. 2.1) of gsl first: brew install gsl@2.1
gem 'classifier-reborn'

group :jekyll_plugins do
  # gem 'jekyll-admin' # using outdated 1.4.x version of sinatra, see https://github.com/jekyll/jekyll-admin/issues/601
  gem 'jekyll-commonmark'
  gem 'jekyll-compose'
  gem 'jekyll-paginate'
  gem 'jekyll-postfiles'
  gem 'jekyll-redirect-from'
  gem 'jekyll-sitemap'
  gem 'jekyll-seo-tag'
  gem 'jekyll-feed'
  # gem 'jekyll-mentions'
  gem 'jekyll-gist'
  gem 'jekyll-github-metadata'
  gem 'jekyll_version_plugin'
  gem 'jekyll-deploy'
  # gem 'jekyll-crosspost-to-medium'
  # gem 'jekyll-webmention_io' # incompatible with jekyll 4, see https://github.com/aarongustafson/jekyll-webmention_io/issues/130
  gem 'jekyll-time-to-read'
  gem 'jekyll-twitter-plugin'
end
