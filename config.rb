require "inifile"

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

data.obg.article.each do |article_id, article_data|
  proxy "/#{article_data.label}.html", "/article.html", :locals => { :article => article_data }, :ignore => true
end

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

activate :contentful do |f|
  config = IniFile.load("contentful_config.ini")
  f.access_token = config["obg"]["CONTENTFUL_DELIVERY_ACCESS_TOKEN"]
  f.space = {obg: config["obg"]["SPACE_ID"]}
  f.content_types = {article: 'article', menu: 'menu'}
end

