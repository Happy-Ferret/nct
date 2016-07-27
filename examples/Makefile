
SUBDIRS=simple helloc

all: $(SUBDIRS)

$(SUBDIRS)::
	$(MAKE) -C $@

clean:
	for i in $(SUBDIRS); do $(MAKE) -C $$i clean; done

run:
	for i in $(SUBDIRS); do $(MAKE) -C $$i run; done
