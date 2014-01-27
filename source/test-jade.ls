require! \jade
require! \marked
require! \mkdirp
require! \path
require! \js-yaml
fs = require \graceful-fs
{map} = require \prelude-ls

#----------------------------------------------------------------------
# Functions

# turn a markdown.md file into ./public/markdown.html
html-file = (public-dir, md-file) ->
  dir = md-file.split(\.)[0]
  pwd = path.join public-dir, dir
  mkdirp pwd
  path.join pwd, \index.html

# Turn a directory of markdown files into HTML
md-dir-to-html = (md-dir, public-dir, template) ->
  err, files <- fs.readdir md-dir
  if err => console.log err
  else map (
    (it) -> md-to-jade md-dir, template, it, html-file(public-dir, it)
  ), files

md-to-jade = (md-dir, template, md-file, filename) ->
  markdown-path = path.join md-dir, md-file
  err, md-stream <- fs.read-file markdown-path, \utf8
  if err => console.error err
  else jade-options template, md-stream, filename

# Takes the Markdown file and puts it into a Jade local variable.
jade-options = (template, md-stream, filename) ->
  options = 
    meta: js-yaml.load md-stream.split(\---)[1]
    md: marked,
    md-content: md-stream.split(\---)[2]
    pretty: true
  jade-render-file template, options, filename

# Renders the Jade template and Markdown mixture.
jade-render-file = (template, options, filename) ->
  err, rendered-html <- jade.render-file template, options
  if err => console.error err
  else fs-write-file filename, rendered-html

# Writes the file to filename.
fs-write-file = (filename, content) ->
  err <- fs.write-file filename, content
  if err => console.error err
  else console.log "#filename was saved."

#----------------------------------------------------------------------
# Variables

pz-template = 'test-jade.jade'
pz-md-dir = '../content'
pz-public-dir = '../public/'

md-dir-to-html pz-md-dir, pz-public-dir, pz-template
