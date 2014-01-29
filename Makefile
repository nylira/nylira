LIVESCRIPT_BIN = ./node_modules/.bin/lsc

build:
	$(LIVESCRIPT_BIN) ./source/build.ls
	rm -rf ./public
	mv ./tmp ./public

all: build
