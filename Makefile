
DESTDIR=$(shell pwd)/.install
export DESTDIR

all:
	$(MAKE) -C src
	$(MAKE) -C doc

install: all
	mkdir -p $(DESTDIR)
	$(MAKE) -C src install
	$(MAKE) -C scripts install
	$(MAKE) -C doc install
	@mkdir -p $(DESTDIR)/usr/share/doc/nct/
	cp -ar examples $(DESTDIR)/usr/share/doc/nct/
	chown -R root.root $(DESTDIR)/usr/share/doc/nct/
	@$(MAKE) -C $(DESTDIR)/usr/share/doc/nct/examples clean

deb: install
	mkdir -p $(DESTDIR)/DEBIAN
	cp package/debian/control $(DESTDIR)/DEBIAN/
	dpkg-deb --build $(DESTDIR) nct.deb

rpm: install
	rm -rf RPMS
	mkdir -p RPMS
	rpmbuild -bb package/rpm/nct.spec --buildroot=`readlink -e $(DESTDIR)`
	mv `find RPMS -name \*.rpm` .
	rm -rf RPMS


deb-check:
	lintian nct.deb

clean:
	$(MAKE) -C src clean
	$(MAKE) -C scripts clean
	$(MAKE) -C doc clean
	rm -f *.rpm *.deb
	rm -rf $(DESTDIR)

test:
	@echo Dummy rule
