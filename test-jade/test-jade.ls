require! \jade
require! \marked
fs = require \graceful-fs

#----------------------------------------------------------------------
# Functions
#
markdown-to-html = (template-file, markdown-file, filename) ->
  err, markdown-string <- fs.read-file markdown-file, \utf8
  if err then console.error err
  else set-options template-file, markdown-string, filename

set-options = (template-file, markdown-string, filename) ->
  options = pretty: true, md: marked, md-content: markdown-string
  render-file template-file, options, filename

render-file = (template-file, options, filename) ->
  err, rendered-html <- jade.render-file template-file, options
  if err then console.error err
  else fs-write-file filename, rendered-html

fs-write-file = (filename, content) ->
  err <- fs.write-file filename, content
  if err then console.error err
  else console.log "#filename was saved."

#----------------------------------------------------------------------
# Variables

template-file = 'test-jade.jade'
markdown-file = '../content/first-post.md'
filename = 'test-jade.html'

markdown-to-html template-file, markdown-file, filename
