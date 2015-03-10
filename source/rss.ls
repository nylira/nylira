require! {\jade \marked \mkdirp \moment \path \js-yaml \typogr \rss}
fs = require \graceful-fs
{filter, map, reverse, sort-by, take, unique} = require \prelude-ls

#----------------------------------------------------------------------
# Variables

markdown-directory = './content/'

url = 'http://nylira.com/'
author = 'Peng Zhong'
pubDate = moment().format('MMMM D, YYYY HH:mm:ss ZZ')
copyright = moment().format('YYYY') + ' ' + author

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

create-feed-item = (feed, article) ->
  feed.item(
    title: article.meta.title
    description: article.content
    url: url + article.slug
    date: moment(article.meta.date).format('MMMM D, YYYY HH:mm:ss ZZ')
  )

#----------------------------------------------------------------------
# Execute

# returns a list of all articles on the site.
articles = input-dir-to-categorized-data markdown-directory

# this should show the latest article
#console.log articles[0]

#----------------------------------------------------------------------
# RSS
# Let's start converting it all to RSS.

create-rss-feed = ->
  feed = new rss(
    title: 'Nylira: Interaction Design & Web Development'
    description: 'The newest articles about interaction design and web development. Brought to you by Nylira.'
    feed_url: url + 'rss.xml'
    site_url: url
    image_url: url + 'assets/img/favicon.png',
    author: author
    managingEditor: author
    webMaster: author
    copyright: copyright
    language: 'en',
    pubDate: pubDate
    ttl: '60'
  )

  for i from 1 to 10
    create-feed-item(feed, articles[i])

  return feed.xml!

fs.write-file-sync './tmp/rss.xml', create-rss-feed!
