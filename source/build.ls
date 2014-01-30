require! \jade
require! \marked
require! \mkdirp
require! \moment
require! \path
require! \js-yaml
require! \typogr
fs = require \graceful-fs
{filter, map, reverse, sort-by, unique} = require \prelude-ls

#----------------------------------------------------------------------
# Index Functions

split-markdown-file = (markdown-directory, markdown-file) ->
  file = path.join markdown-directory, markdown-file
  data = fs.read-file-sync file, \utf8

  meta = js-yaml.load data.split(\---)[1]
  content = typogr.typogrify marked data.split(\---)[2]
  slug = markdown-file.split(\.)[0]

  meta: meta, content: content, slug: slug

of-category = (category, db) ->
  filter (.meta.category == category), db
  |> sort-by (.meta.date)

categorize = (essays) ->
  map (.meta.category), essays |> unique
  |> map ((it) -> name: it, essays: of-category it, essays)
  |> sort-by (.name)

markdown-directory-to-categorized-data = (markdown-directory) ->
  fs.readdir-sync markdown-directory
  |> map ((it) -> split-markdown-file markdown-directory, it)
  |> categorize

#----------------------------------------------------------------------
# Essay Functions

# turn a markdown.md file into ./public/markdown.html
html-file = (output-dir, md-file) ->
  dir = md-file.split(\.)[0]
  pwd = path.join output-dir, dir
  mkdirp pwd
  path.join pwd, \index.html

# Renders the Jade template and Markdown mixture.
render-file = (template, options, filename) ->
  err, rendered-html <- jade.render-file template, options
  if err => console.error err
  else fs.write-file-sync filename, rendered-html

markdown-to-jade = (markdown-directory, template, md-file, filename) ->
  markdown-path = path.join markdown-directory, md-file
  data = fs.read-file-sync markdown-path, \utf8

  options = 
    depth: '../'
    meta: js-yaml.load data.split(\---)[1]
    md: marked,
    content: typogr.typogrify marked data.split(\---)[2]
    moment: moment
    pretty: true
    typogr: typogr

  render-file template, options, filename

markdown-directory-to-html = (markdown-directory, output-dir, template) ->
  files = fs.readdir-sync markdown-directory
  map (
    (it) -> markdown-to-jade markdown-directory, template, it, html-file(output-dir, it)
  ), files


#----------------------------------------------------------------------
# Variables

pz-essay-template = './source/views/essay.jade'
pz-markdown-dir = './content'
pz-output-dir = './tmp/'

pz-index-template = './source/views/index.jade'
pz-index-filename = './tmp/index.html'
pz-index-options =
  depth: './'
  categories: markdown-directory-to-categorized-data(pz-markdown-dir)
  pretty: true
  moment: moment

#----------------------------------------------------------------------
# Execute

# render index
render-file pz-index-template, pz-index-options, pz-index-filename

# render essays
markdown-directory-to-html(pz-markdown-dir, pz-output-dir, pz-essay-template)
