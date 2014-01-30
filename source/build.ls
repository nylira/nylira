require! \jade
require! \marked
require! \mkdirp
require! \path
require! \js-yaml
require! \typogr
fs = require \graceful-fs
{map} = require \prelude-ls

essay-objects = []

#----------------------------------------------------------------------
# Index Functions

folder-of-files-to-filenames = (folder-of-files) ->
  files = fs.readdir-sync folder-of-files
  filenames = map (.split(\.)[0]), files

# turn a markdown.md file into ./public/markdown.html
html-file = (output-dir, md-file) ->
  dir = md-file.split(\.)[0]
  pwd = path.join output-dir, dir
  mkdirp pwd
  path.join pwd, \index.html

# Turn a directory of markdown files into HTML
markdown-directory-to-array = (md-dir, output-dir, template) ->
  files = fs.readdir-sync md-dir
  map (
    (it) -> markdown-to-object md-dir, template, it, html-file(output-dir, it)
  ), files

markdown-to-object = (md-dir, template, md-file, filename) ->
  slug = md-file.split(\.)[0]
  markdown-path = path.join md-dir, md-file
  md-stream = fs.read-file-sync markdown-path, \utf8
  essay-meta = js-yaml.load md-stream.split(\---)[1]
  essay-content = typogr.typogrify marked md-stream.split(\---)[2]
  essay-objects.push meta: essay-meta, content: essay-content, slug: slug

#----------------------------------------------------------------------
# Essay Functions

# Turn a directory of markdown files into HTML
markdown-directory-to-html = (md-dir, output-dir, template) ->
  err, files <- fs.readdir md-dir
  if err => console.log err
  else map (
    (it) -> markdown-to-jade md-dir, template, it, html-file(output-dir, it)
  ), files

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
  #else console.log "#filename was saved."

#----------------------------------------------------------------------
# Variables: Essays

pz-essay-template = './source/views/essay.jade'
pz-markdown-dir = './content'
pz-output-dir = './tmp/'

#----------------------------------------------------------------------
# Variables: Index

markdown-directory-to-array(pz-markdown-dir, pz-output-dir, pz-essay-template)

pz-index-template = './source/views/index.jade'
pz-index-filename = './tmp/index.html'
pz-index-options =
  depth: './'
  essays: essay-objects
  pretty: true

#----------------------------------------------------------------------
# Execute

mkdirp pz-output-dir

render-file pz-index-template, pz-index-options, pz-index-filename

markdown-directory-to-html(pz-markdown-dir, pz-output-dir, pz-essay-template)
