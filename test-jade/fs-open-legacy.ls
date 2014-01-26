#----------------------------------------------------------------------
# Prerequisites

require! \jade
require! \marked
fs = require \graceful-fs

#----------------------------------------------------------------------
# Functions

filename = './content/first-post.md'
var data

read-file = (filename) ->
  exists <- fs.exists filename
  if !exists then console.err err
  else fs-stat filename

fs-stat = (filename) ->
  err, stats <- fs.stat filename
  if err then console.err err
  else fs-open filename, stats

fs-open = (filename, stats) ->
  err, fd <- fs.open filename, \r
  if err then console.err err
  else fs-read stats, fd

fs-read = (stats, fd) ->
  buffer = new Buffer stats.size
  err, bytes-read, buffer <- fs.read fd, buffer, 0, buffer.length, null
  if err then console.err err
  else buffer-to-s fd, buffer

buffer-to-s = (fd, buffer) ->
  data := buffer.to-string \utf8, 0, buffer.length
  console.log data
  fs.close fd


jade-render-file = (template, options, filename) ->
  err, html-compiled <- jade.render-file template, options
  if err
  then console.error err
  else fs-write-file fs-filename, html-compiled

fs-write-file = (filename, content) ->
  err <- fs.write-file filename, content
  if err
  then console.error err
  else console.log "#fs-filename was saved."

#----------------------------------------------------------------------
# Variables

jade-template = 'test-jade.jade'
fs-filename = 'test-jade.html'

jade-options =
  pretty: true
  md: marked
  md-content: read-file filename

jade-render-file jade-template, jade-options, fs-filename
