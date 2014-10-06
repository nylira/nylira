// Generated by LiveScript 1.3.0
(function(){
  var jade, marked, mkdirp, moment, path, jsYaml, typogr, fs, ref$, filter, map, reverse, sortBy, take, unique, splitMarkdownFile, ofCategory, categorize, inputDirToCategorizedData, allProjects, allArticles, recentProjects, recentArticles, htmlize, renderFile, markdownToJade, renderFiles, pzArticleTemplate, pzArticleInputDir, pzArticleOutputDir, pzProfileTemplate, pzProfileFilename, pzProfileOptions, pzArticlesTemplate, pzArticlesFilename, pzArticlesOptions, pzContactTemplate, pzContactFilename, pzContactOptions, pzProjectsTemplate, pzProjectsFilename, pzProjectsOptions, pzIndexTemplate, pzIndexFilename, pzIndexOptions;
  jade = require('jade');
  marked = require('marked');
  mkdirp = require('mkdirp');
  moment = require('moment');
  path = require('path');
  jsYaml = require('js-yaml');
  typogr = require('typogr');
  fs = require('graceful-fs');
  ref$ = require('prelude-ls'), filter = ref$.filter, map = ref$.map, reverse = ref$.reverse, sortBy = ref$.sortBy, take = ref$.take, unique = ref$.unique;
  splitMarkdownFile = function(inputDir, markdownFile){
    var data;
    data = function(it){
      return fs.readFileSync(it, 'utf8');
    }(
    path.join(inputDir, markdownFile));
    return {
      meta: jsYaml.load(data.split('---')[1]),
      content: typogr.typogrify(marked(data.split('---')[2])),
      slug: markdownFile.split('.')[0]
    };
  };
  ofCategory = function(category, db){
    return reverse(
    sortBy(function(it){
      return it.meta.date;
    })(
    filter(function(it){
      return it.meta.status !== 'closed';
    })(
    filter(function(it){
      return it.meta.category === category;
    }, db))));
  };
  categorize = function(articles){
    return sortBy(function(it){
      return it.name;
    })(
    map(function(it){
      return {
        name: it,
        articles: ofCategory(it, articles)
      };
    })(
    unique(
    map(function(it){
      return it.meta.category;
    }, articles))));
  };
  inputDirToCategorizedData = function(inputDir){
    return categorize(
    map(function(it){
      return splitMarkdownFile(inputDir, it);
    })(
    fs.readdirSync(inputDir)));
  };
  allProjects = function(inputDir){
    return reverse(
    sortBy(function(it){
      return it.meta.date;
    })(
    filter(function(it){
      return it.meta.status !== 'closed';
    })(
    filter(function(it){
      return it.meta.category === 'projects';
    })(
    map(function(it){
      return splitMarkdownFile(inputDir, it);
    })(
    fs.readdirSync(inputDir))))));
  };
  allArticles = function(inputDir){
    return reverse(
    sortBy(function(it){
      return it.meta.date;
    })(
    filter(function(it){
      return it.meta.status !== 'closed';
    })(
    filter(function(it){
      return it.meta.category !== 'projects';
    })(
    map(function(it){
      return splitMarkdownFile(inputDir, it);
    })(
    fs.readdirSync(inputDir))))));
  };
  recentProjects = function(inputDir, num){
    return take(num)(
    allProjects(inputDir));
  };
  recentArticles = function(inputDir, num){
    return take(num)(
    allArticles(inputDir));
  };
  htmlize = function(outputDir, markdownFile){
    var directory;
    directory = path.join(outputDir, markdownFile.split('.')[0]);
    mkdirp(directory);
    return path.join(directory, 'index.html');
  };
  renderFile = function(template, options, filename){
    return jade.renderFile(template, options, function(err, html){
      if (err) {
        return console.error(err);
      } else {
        return fs.writeFileSync(filename, html);
      }
    });
  };
  markdownToJade = function(inputDir, template, markdownFile, filename){
    var file, data, options;
    file = path.join(inputDir, markdownFile);
    data = fs.readFileSync(file, 'utf8');
    options = {
      depth: '../',
      meta: jsYaml.load(data.split('---')[1]),
      md: marked,
      content: typogr.typogrify(marked(data.split('---')[2])),
      moment: moment,
      typogr: typogr,
      pretty: true
    };
    return renderFile(template, options, filename);
  };
  renderFiles = function(template, inputDir, outputDir){
    var files;
    return files = map(function(it){
      return markdownToJade(inputDir, template, it, htmlize(outputDir, it));
    })(
    fs.readdirSync(inputDir, 'utf8'));
  };
  pzArticleTemplate = './source/views/article.jade';
  pzArticleInputDir = './content/';
  pzArticleOutputDir = './tmp/';
  pzProfileTemplate = './source/views/profile.jade';
  pzProfileFilename = './tmp/profile/index.html';
  pzProfileOptions = {
    depth: './../',
    moment: moment,
    pretty: true,
    meta: {
      bodyclass: 'profile'
    }
  };
  pzArticlesTemplate = './source/views/articles.jade';
  pzArticlesFilename = './tmp/articles/index.html';
  pzArticlesOptions = {
    articles: allArticles(pzArticleInputDir),
    depth: './../',
    moment: moment,
    pretty: true,
    meta: {
      bodyclass: 'articles'
    }
  };
  pzContactTemplate = './source/views/contact.jade';
  pzContactFilename = './tmp/contact/index.html';
  pzContactOptions = {
    depth: './../',
    moment: moment,
    pretty: true,
    meta: {
      bodyclass: 'contact'
    }
  };
  pzProjectsTemplate = './source/views/projects.jade';
  pzProjectsFilename = './tmp/projects/index.html';
  pzProjectsOptions = {
    projects: allProjects(pzArticleInputDir),
    depth: './../',
    moment: moment,
    pretty: true,
    meta: {
      bodyclass: 'projects'
    }
  };
  pzIndexTemplate = './source/views/index.jade';
  pzIndexFilename = './tmp/index.html';
  pzIndexOptions = {
    categories: inputDirToCategorizedData(pzArticleInputDir),
    articles: recentArticles(pzArticleInputDir, 3),
    projects: recentProjects(pzArticleInputDir, 3),
    depth: './',
    moment: moment,
    pretty: true,
    meta: {
      bodyclass: 'home'
    }
  };
  renderFiles(pzArticleTemplate, pzArticleInputDir, pzArticleOutputDir);
  renderFile(pzIndexTemplate, pzIndexOptions, pzIndexFilename);
  renderFile(pzProjectsTemplate, pzProjectsOptions, pzProjectsFilename);
  renderFile(pzArticlesTemplate, pzArticlesOptions, pzArticlesFilename);
  renderFile(pzProfileTemplate, pzProfileOptions, pzProfileFilename);
  renderFile(pzContactTemplate, pzContactOptions, pzContactFilename);
}).call(this);
