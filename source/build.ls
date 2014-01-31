require! {\jade \marked \mkdirp \moment \path \js-yaml \typogr}
fs = require \graceful-fs
{filter, map, reverse, sort-by, unique} = require \prelude-ls

#----------------------------------------------------------------------
# Index Functions

split-markdown-file = (input-directory, markdown-file) ->
  data = path.join input-directory, markdown-file 
  |> (it) -> fs.read-file-sync it, \utf8

  meta: js-yaml.load data.split(\---)[1]
  content: typogr.typogrify marked data.split(\---)[2]
  slug: markdown-file.split(\.)[0]

of-category = (category, db) ->
  filter (.meta.category == category), db
  |> filter (.meta.status != \closed)
  |> sort-by (.meta.date)

categorize = (essays) ->
  map (.meta.category), essays |> unique
  |> map ((it) -> name: it, essays: of-category it, essays)
  |> sort-by (.name)

input-directory-to-categorized-data = (input-directory) ->
  fs.readdir-sync input-directory
  |> map ((it) -> split-markdown-file input-directory, it)
  |> categorize

#----------------------------------------------------------------------
# Essay Functions

htmlize = (output-dir, markdown-file) ->
  directory = path.join output-dir, markdown-file.split(\.)[0]
  mkdirp directory
  path.join directory, \index.html

render-file = (template, options, filename) ->
  err, html <- jade.render-file template, options
  if err => console.error err
  else fs.write-file-sync filename, html

markdown-to-jade = (input-directory, template, markdown-file, filename) ->
  file = path.join input-directory, markdown-file
  data = fs.read-file-sync file, \utf8

  options = 
    depth: '../'
    meta: js-yaml.load data.split(\---)[1]
    md: marked,
    content: typogr.typogrify marked data.split(\---)[2]
    moment: moment
    pretty: true
    typogr: typogr

  render-file template, options, filename

render-files = (template, input-dir, output-dir) ->
  files = fs.readdir-sync input-dir, \utf8
  |> map ((it) -> markdown-to-jade input-dir, template, it, htmlize(output-dir, it))

#----------------------------------------------------------------------
# Variables

pz-essay-template = './source/views/essay.jade'
pz-essay-input-dir = './content/'
pz-essay-output-dir = './tmp/'

pz-index-template = './source/views/index.jade'
pz-index-filename = './tmp/index.html'
pz-index-options =
  categories: input-directory-to-categorized-data(pz-essay-input-dir)
  depth: './'
  moment: moment
  pretty: true

#----------------------------------------------------------------------
# Execute

render-files pz-essay-template, pz-essay-input-dir, pz-essay-output-dir
render-file pz-index-template, pz-index-options, pz-index-filename
