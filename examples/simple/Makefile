#
# Simple demonstration of nCrux Configuration Tool (nct)
#
CONF_FRAGMENT_FILE=frag.conf
#NCT=nct
NCT=nct --prefix "SIM_"

all: merge test-all

.PHONY: .conf

.conf:
	$(NCT)

merge: .conf
	$(NCT) merge -p SIM_ -f $(CONF_FRAGMENT_FILE)

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
ifneq "$(shell which perl)" ''
	perl test.pl
else
	@echo Perl is not found. Skipping
endif

test-py: py
ifneq "$(shell which python)" ''
	python test.py
else
	@echo Python is not found. Skipping
endif

test-xml: xml
ifneq "$(shell which xmllint)" ''
	xmllint simple_nct.xml
else
	@echo xmllint is not found. Skipping
endif

test-php: php
ifneq "$(shell which php)" ''
	php test.php
else
	@echo PHP is not found. Skipping
endif

test-go: go
ifneq "$(shell which go)" ''
	go run test.go
else
	@echo Golang is not found. Skipping
endif

test-rb: rb
ifneq "$(shell which ruby)" ''
	-./test.rb
else
	@echo Ruby is not found. Skipping
endif

test-js: js
ifneq "$(shell which nodejs)" ''
	nodejs test.js
else
	@echo NodeJS is not found. Skipping
endif


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

