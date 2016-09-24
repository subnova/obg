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

if File.exist?('data/obg/page')
  data.obg.page.each do |page_id, page_data|
    proxy "/#{page_data.article.label}.html", "/page.html", :locals => { :page => page_data, :title => page_data.title }, :ignore => true
  end
end

if File.exist?('data/obg/multipage')
  data.obg.multipage.each do |page_id, page_data|
    proxy "/#{page_data.label}.html", "/multipage.html", :locals => { :page => page_data, :title => page_data.title }, :ignore => true
  end
end

if File.exist?('data/obg/menupage')
  data.obg.menupage.each do |page_id, page_data|
    proxy "/#{page_data.label}.html", "/menupage.html", :locals => { :page => page_data, :title => page_data.title }, :ignore => true
  end
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
  f.content_types = {multipage: 'multipleArticlePage', page: 'page', menupage: 'menuPage' }
  f.cda_query = { include: 2 }
end

