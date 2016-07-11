
PKGVER=$(shell git describe --tags | sed -e 's|^v||g' -e 's|-.*-|.|g')
export PKGVER

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
	find examples/ -type f | xargs -i install -D -m 644 {} $(DESTDIR)/usr/share/doc/nct/{}
	find $(DESTDIR)/usr/share/doc/nct/examples -type f -name .gitignore | xargs rm -f
	@$(MAKE) -C $(DESTDIR)/usr/share/doc/nct/examples clean

deb: install
	mkdir -p $(DESTDIR)/DEBIAN
	sed 's|^Version:.*$$|Version: $(PKGVER)|' package/debian/control > $(DESTDIR)/DEBIAN/control
	dpkg-deb --build $(DESTDIR) nct_$(PKGVER)_amd64.deb
	rm -rf $(DESTDIR)/DEBIAN

rpm: install
	rm -rf RPMS
	mkdir -p RPMS
	sed 's|^Version:.*$$|Version: $(PKGVER)|' package/rpm/nct.spec > .nct.spec
	rpmbuild -bb .nct.spec --buildroot=`readlink -e $(DESTDIR)`
	mv `find RPMS -name \*.rpm` .
	rm -rf RPMS
	rm -f .nct.spec

deb-check:
	lintian nct_$(PKGVER)_amd64.deb

rpm-check:
	rpmlint nct*.rpm

clean:
	$(MAKE) -C src clean
	$(MAKE) -C scripts clean
	$(MAKE) -C doc clean
	rm -f *.rpm *.deb
	rm -rf $(DESTDIR)

test:
	@echo Dummy rule
