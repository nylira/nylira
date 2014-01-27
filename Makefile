LIVESCRIPT_BIN = ./node_modules/.bin/lsc

build-essays:
	$(LIVESCRIPT_BIN) ./source/build-essays.ls

build-index:
	$(LIVESCRIPT_BIN) ./source/build-index.ls

all: build-essays build-index
