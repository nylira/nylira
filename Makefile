default: reset-dirs build-css build-html

LIVESCRIPT_BIN = ./node_modules/.bin/lsc
STYLUS_BIN = ./node_modules/.bin/stylus
STYLUS_PARAMS = -c -u ./node_modules/nib/
STYLUS_WATCH_PARAMS = -c -w source/stylesheets/screen.styl -u ./node_modules/nib/ -o public/assets/css/

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
	$(STYLUS_BIN) $(STYLUS_PARAMS) <$(STYL) >$(CSS)

build-html:
	cp -r ./images ./tmp/assets/
	cp -r ./source/javascript/* ./tmp/assets/js/
	cp -r ./source/fonts/* ./tmp/assets/fonts/
	$(LIVESCRIPT_BIN) ./source/build.ls
	rm -rf ./public && mv ./tmp ./public

watch-css:
	$(STYLUS_BIN) $(STYLUS_WATCH_PARAMS)
