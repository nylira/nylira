require! {\jade \marked \mkdirp \moment \path \js-yaml \typogr}
fs = require \graceful-fs
{filter, map, reverse, sort-by, take, unique} = require \prelude-ls

#----------------------------------------------------------------------
# Variables

markdown-directory = './content/'

#----------------------------------------------------------------------
# Index Functions

# reads a markdown file and turns it into an article object
split-markdown-file = (input-dir, markdown-file) ->
  data = path.join input-dir, markdown-file 
  |> (it) -> fs.read-file-sync it, \utf8

  content =
    meta: js-yaml.load data.split(\---)[1]
    content: typogr.typogrify marked data.split(\---)[2]
    slug: markdown-file.split(\.)[0]

  return content

# filters a list of articles to NOT show projects, NOT show closed articles,
# and sort by newest first
filter-articles = (articles) ->
  filter (.meta.status != \closed), articles
  |> filter (.meta.category != \projects)
  |> sort-by (.meta.date)
  |> reverse

# transforms a directory of markdown files into a list of article objects
input-dir-to-categorized-data = (input-dir) ->
  fs.readdir-sync input-dir
  |> map ((it) -> split-markdown-file input-dir, it)
  |> filter-articles

#----------------------------------------------------------------------
# Execute

# returns a list of all articles on the site.
articles = input-dir-to-categorized-data markdown-directory

# this should show the latest article
console.log articles[0]

#----------------------------------------------------------------------
# RSS
# Let's start converting it all to RSS.

feed = new RSS(
  title: 'Nylira Articles'
  description: 'This feed offers a list of the newest articles about interaction design and web development posted to Nylira'
  feed_url: 'http://nylira.com/rss.xml'
  site_url: 'http://nylira.com',
  image_url: 'http://nylira.com/assets/img/favicon.png',

)

