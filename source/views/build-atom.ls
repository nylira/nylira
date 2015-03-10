require! {\jade \marked \mkdirp \moment \path \js-yaml \typogr}
fs = require \graceful-fs
{filter, map, reverse, sort-by, take, unique} = require \prelude-ls

pz-article-input-dir = './content/'

cool-files = fs.readdir-sync pz-article-input-dir, \utf8

console.log(cool-files)
