require! {\jade \marked \mkdirp \moment \path \js-yaml \typogr}
fs = require \graceful-fs
{filter, map, reverse, sort-by, take, unique} = require \prelude-ls

#----------------------------------------------------------------------
# Index Functions

split-markdown-file = (input-dir, markdown-file) ->
  data = path.join input-dir, markdown-file 
  |> (it) -> fs.read-file-sync it, \utf8

  meta: js-yaml.load data.split(\---)[1]
  content: typogr.typogrify marked data.split(\---)[2]
  slug: markdown-file.split(\.)[0]

of-category = (category, db) ->
  filter (.meta.category == category), db
  |> filter (.meta.status != \closed)
  |> sort-by (.meta.date)
  |> reverse

categorize = (articles) ->
  map (.meta.category), articles |> unique
  |> map ((it) -> name: it, articles: of-category it, articles)
  |> sort-by (.name)

input-dir-to-categorized-data = (input-dir) ->
  fs.readdir-sync input-dir
  |> map ((it) -> split-markdown-file input-dir, it)
  |> categorize

# return a truncated list of recent projects
recent-projects = (input-dir, num) ->
  fs.readdir-sync input-dir
  |> map ((it) -> split-markdown-file input-dir, it)
  |> filter (.meta.category == \projects)
  |> filter (.meta.status != \closed)
  |> sort-by (.meta.date)
  |> reverse
  |> take 3

# return a truncated list of recently written/updated articles
recent-articles = (input-dir, num) ->
  fs.readdir-sync input-dir
  |> map ((it) -> split-markdown-file input-dir, it)
  |> filter (.meta.status != \closed)
  |> sort-by (.meta.date)
  |> reverse
  |> take 3

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

markdown-to-jade = (input-dir, template, markdown-file, filename) ->
  file = path.join input-dir, markdown-file
  data = fs.read-file-sync file, \utf8

  options = 
    depth: '../'
    meta: js-yaml.load data.split(\---)[1]
    md: marked
    content: typogr.typogrify marked data.split(\---)[2]
    moment: moment
    typogr: typogr
    pretty: true

  render-file template, options, filename

render-files = (template, input-dir, output-dir) ->
  files = fs.readdir-sync input-dir, \utf8
  |> map ((it) -> markdown-to-jade input-dir, template, it, htmlize(output-dir, it))


#----------------------------------------------------------------------
# Variables

pz-article-template = './source/views/article.jade'
pz-article-input-dir = './content/'
pz-article-output-dir = './tmp/'

pz-index-template = './source/views/index.jade'
pz-index-filename = './tmp/index.html'
pz-index-options =
  categories: input-dir-to-categorized-data(pz-article-input-dir)
  articles: recent-articles(pz-article-input-dir)
  projects: recent-projects(pz-article-input-dir)
  depth: './'
  moment: moment
  pretty: true
  meta: {bodyclass: 'home'}

#----------------------------------------------------------------------
# Execute

render-files pz-article-template, pz-article-input-dir, pz-article-output-dir
render-file pz-index-template, pz-index-options, pz-index-filename
