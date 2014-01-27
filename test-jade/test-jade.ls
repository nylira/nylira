require! \jade
require! \marked
require! \path
fs = require \graceful-fs
{map} = require \prelude-ls

#----------------------------------------------------------------------
# Functions
#

# This function turns a Jade template, a Markdown file, and a filename
# into perfect html after sending the data through the wringer.
markdown-to-html = (template-file, markdown-file, filename) ->
  markdown-path = path.join markdown-dir, markdown-file
  filename = "test" + Math.floor(Math.random! * 100) + ".html"
  err, markdown-string <- fs.read-file markdown-path, \utf8
  if err => console.error err
  else set-options template-file, markdown-string, filename

# Takes the Markdown file and puts it into a Jade local variable.
set-options = (template-file, markdown-string, filename) ->
  options = pretty: true, md: marked, md-content: markdown-string
  render-file template-file, options, filename

# Renders the Jade template and Markdown mixture.
render-file = (template-file, options, filename) ->
  err, rendered-html <- jade.render-file template-file, options
  if err => console.error err
  else fs-write-file filename, rendered-html

# Writes the file to filename.
fs-write-file = (filename, content) ->
  err <- fs.write-file filename, content
  if err => console.error err
  else console.log "#filename was saved."

#----------------------------------------------------------------------
# Variables

template-file = 'test-jade.jade'
filename = 'test-jade.html'
markdown-dir= './content'

err, files <- fs.readdir markdown-dir
if err => console.log err
else
  map ((it) -> markdown-to-html(template-file, it, filename)), files

