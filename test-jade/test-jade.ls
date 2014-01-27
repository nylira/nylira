require! \jade
require! \marked
require! \mkdirp
require! \path
fs = require \graceful-fs
{map} = require \prelude-ls
yaml = require \js-yaml

#----------------------------------------------------------------------
# Functions

# turn a markdown.md file into ./public/markdown.html
html-file = (public-dir, md-file) ->
  dir = md-file.split('.')[0]
  pwd = path.join public-dir, dir
  mkdirp pwd
  path.join pwd, \index.html

# Turn a directory of markdown files into HTML
md-dir-to-html = (md-dir, public-dir, template) ->
  err, files <- fs.readdir md-dir
  if err => console.log err
  else map (
    (it) -> md-to-html md-dir, template, it, html-file(public-dir, it)
  ), files

# This function turns a Jade template, a Markdown file, and a filename
# into perfect html after sending the data through the wringer.
md-to-html = (md-dir, template, md-file, filename) ->
  markdown-path = path.join md-dir, md-file
  err, md-stream <- fs.read-file markdown-path, \utf8
  if err => console.error err
  else set-options template, md-stream, filename

# Takes the Markdown file and puts it into a Jade local variable.
set-options = (template, md-stream, filename) ->
  md-split-stream = md-stream.split('---')
  yaml-part = yaml.load md-split-stream[1]
  md-part = md-split-stream[2]
  options = pretty: true, md: marked, md-content: md-part, meta: yaml-part
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
  else console.log "#filename was saved."

#----------------------------------------------------------------------
# Variables

pz-template = 'test-jade.jade'
pz-md-dir = './content'
pz-public-dir = './public/'

md-dir-to-html pz-md-dir, pz-public-dir, pz-template
