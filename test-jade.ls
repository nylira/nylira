#----------------------------------------------------------------------
# Prerequisites
#----------------------------------------------------------------------

require! \jade
require! \fs

#----------------------------------------------------------------------
# Functions
#----------------------------------------------------------------------

jade-render-file = (template, options, filename) ->
  err, html-compiled <- jade.render-file template, options
  if err
    console.error error
  else
    fs-write-file fs-filename, html-compiled

fs-write-file = (filename, content) ->
  err <- fs.write-file filename, content
  if err
    console.error error
  else
    console.log "#fs-filename was saved."

#----------------------------------------------------------------------
# Variables
#----------------------------------------------------------------------

jade-template = 'test-jade.jade'
fs-filename = 'test-jade.html'

jade-options =
  pretty: true

jade-render-file jade-template, jade-options, fs-filename
