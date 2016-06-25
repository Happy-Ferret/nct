#
# Simple demonstration of nCrux Configuration Tool (nct)
#
CONF_FRAGMENT_FILE=frag.conf
NCT=nct
#NCT=nct --prefix "CONFIG_"

all: merge test-all

.PHONY: .conf

.conf:
	$(NCT)

merge: .conf
	$(NCT) merge -f $(CONF_FRAGMENT_FILE)

gen-all: h pl py xml php go

h:
	$(NCT) gen -o simple_nct.h

pl:
	$(NCT) gen -o simple_nct.pl

py:
	$(NCT) gen -o simple_nct.py

xml:
	$(NCT) gen -o simple_nct.xml

php:
	$(NCT) gen -o simple_nct.php

go:
	-mkdir -p simple_nct
	$(NCT) gen -o simple_nct/simple_nct.go

rb:
	$(NCT) gen -o simple_nct.rb

js:
	$(NCT) gen -o simple_nct.js

test-all: test-h test-pl test-py test-xml test-php test-go test-rb test-js

test-h: h
	$(CC) test.c -o test
	./test

test-pl: pl
	perl test.pl

test-py: py
	python test.py

test-xml: xml
	xmllint simple_nct.xml

test-php: php
	php test.php

test-go: go
	go run test.go

test-rb: rb
	./test.rb

test-js: js
	nodejs test.js


clean:
	rm -f .conf .conf.old
	rm -f simple_nct.h test
	rm -f simple_nct.pl
	rm -f simple_nct.xml
	rm -f simple_nct.py
	rm -rf simple_nct/
	rm -f simple_nct.php
	rm -f simple_nct.py simple_nct.pyc
	rm -f simple_nct.rb
	rm -f simple_nct.js

