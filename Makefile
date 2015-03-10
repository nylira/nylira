default: reset-dirs build-css build-html

LIVESCRIPT = ./node_modules/.bin/lsc
STYLUS = ./node_modules/.bin/stylus
STYLUS_PARAMS = -c -u ./node_modules/nib/ --include-css
STYLUS_WATCH_PARAMS = -c -w source/stylesheets/screen.styl -u ./node_modules/nib/ -o public/assets/css/ --include-css

STYL = ./source/stylesheets/screen.styl
CSS = ./tmp/assets/css/screen.css

reset-dirs:
	rm -rf ./tmp
	mkdir -p ./tmp/assets/css
	mkdir -p ./tmp/assets/js
	mkdir -p ./tmp/assets/fonts
	mkdir -p ./tmp/projects
	mkdir -p ./tmp/profile
	mkdir -p ./tmp/contact
	mkdir -p ./tmp/articles

build-css:
	$(STYLUS) <$(STYL) >$(CSS) $(STYLUS_PARAMS) 

build-html:
	cp -r ./images ./tmp/assets/
	cp -r ./source/javascript/* ./tmp/assets/js/
	cp -r ./source/fonts/* ./tmp/assets/fonts/
	$(LIVESCRIPT) ./source/build.ls
	$(LIVESCRIPT) ./source/rss.ls
	rm -rf ./public && mv ./tmp ./public

wcss:
	$(STYLUS) $(STYLUS_WATCH_PARAMS)
