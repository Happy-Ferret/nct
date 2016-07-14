
all: src/helloc_nct.h
	$(MAKE) -C src

.conf: input.nct src/main.nct
	nct

menu: input.nct src/main.nct
	nct menu

src/helloc_nct.h: .conf
	nct gen -o $@

clean:
	$(MAKE) -C src clean
	rm -f .conf .conf.old src/helloc_nct.h

