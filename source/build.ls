require! \jade
require! \marked
require! \mkdirp
require! \moment
require! \path
require! \js-yaml
require! \typogr
fs = require \graceful-fs
{filter, map, reverse, sort-by, unique} = require \prelude-ls

pz-essays = []

#----------------------------------------------------------------------
# Index Functions

# Turn a directory of markdown files into HTML
markdown-directory-to-array = (md-dir) ->
  fs.readdir-sync md-dir
  |> map ((it) -> split-file md-dir, it)
  |> categorize

split-file = (md-dir, markdown-file) ->
  file = path.join md-dir, markdown-file
  data = fs.read-file-sync file, \utf8

  meta = js-yaml.load data.split(\---)[1]
  content = typogr.typogrify marked data.split(\---)[2]
  slug = markdown-file.split(\.)[0]

  result = meta: meta, content: content, slug: slug

categorize = (essays) ->
  map (.meta.category), essays |> unique
  |> map ((it) -> name: it, essays: of-category it, essays)
  |> sort-by (.name)

of-category = (category, db) ->
  filter (.meta.category == category), db

#----------------------------------------------------------------------
# Essay Functions

# Turn a directory of markdown files into HTML
markdown-directory-to-html = (md-dir, output-dir, template) ->
  err, files <- fs.readdir md-dir
  if err => console.log err
  else map (
    (it) -> markdown-to-jade md-dir, template, it, html-file(output-dir, it)
  ), files

# turn a markdown.md file into ./public/markdown.html
html-file = (output-dir, md-file) ->
  dir = md-file.split(\.)[0]
  pwd = path.join output-dir, dir
  mkdirp pwd
  path.join pwd, \index.html

markdown-to-jade = (md-dir, template, md-file, filename) ->
  markdown-path = path.join md-dir, md-file
  err, md-stream <- fs.read-file markdown-path, \utf8
  if err => console.error err
  else jade-options template, md-stream, filename

# Takes the Markdown file and puts it into a Jade local variable.
jade-options = (template, md-stream, filename) ->
  options = 
    depth: '../'
    meta: js-yaml.load md-stream.split(\---)[1]
    md: marked,
    content: typogr.typogrify marked md-stream.split(\---)[2]
    moment: moment
    pretty: true
    typogr: typogr
  render-file template, options, filename

# Renders the Jade template and Markdown mixture.
render-file = (template, options, filename) ->
  err, rendered-html <- jade.render-file template, options
  if err => console.error err
  else fs-write-file filename, rendered-html

# Writes the file to filename.
fs-write-file = (filename, content) ->
  err <- fs.write-file filename, content
  if err => console.error err

#----------------------------------------------------------------------
# Variables

pz-essay-template = './source/views/essay.jade'
pz-markdown-dir = './content'
pz-output-dir = './tmp/'

pz-index-template = './source/views/index.jade'
pz-index-filename = './tmp/index.html'
pz-index-options =
  depth: './'
  categories: markdown-directory-to-array(pz-markdown-dir)
  pretty: true
  moment: moment

#----------------------------------------------------------------------
# Execute

# render index
render-file pz-index-template, pz-index-options, pz-index-filename

# render essays
markdown-directory-to-html(pz-markdown-dir, pz-output-dir, pz-essay-template)
