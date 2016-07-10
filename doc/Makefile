DOCPATH=$(DESTDIR)/usr/share/doc/nct
MANPATH=$(DESTDIR)/usr/share/man

all:

nct.1: nct.md
	rst2man $^ $@

nct.html: nct.md
	rst2html $^ $@

install:
	sed 's|^:Version:.*$$|:Version: $(PKGVER)|' nct.md > .nct.md
	sed -i 's|^:Date:.*$$|:Date: $(shell date +"%d %b %Y")|' .nct.md
	rst2html .nct.md .nct.html
	rst2man .nct.md .nct.1
	install -D -m 0644 .nct.1 $(MANPATH)/man1/nct.1
	install -D -m 0644 .nct.html $(DOCPATH)/nct.html
	gzip -n -9 -f $(MANPATH)/man1/nct.1
	install -m 0644 -D ../AUTHORS $(DOCPATH)/AUTHORS
	install -m 0644 -D ../copyright $(DOCPATH)/copyright
	install -m 0644 -D ../README.md $(DOCPATH)/README.md
	install -m 0644 -D ../Changelog $(DOCPATH)/changelog
	gzip -n -9 -f $(DOCPATH)/changelog
	$(RM) .nct.md .nct.1 .nct.html

uninstall:
	rm -f $(MANPATH)/man1/nct.1.gz
	rm -f $(MANPATH)/man1/nct.html
	rm -f $(DOCPATH)/AUTHORS
	rm -f $(DOCPATH)/copyright
	rm -f $(DOCPATH)/README.md
	rm -f $(DOCPATH)/changelog.gz

clean:


