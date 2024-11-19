ACLOCAL_AMFLAGS = -I m4 --install

SUBDIRS = c-ares curl

DISTCLEANFILES = *~ autoscan.log

distclean-local:
	-rm -rf autom4te.cache || rmdir autom4te.cache

distclean-generated: distclean-hdr distclean-libtool distclean-tags distclean-generic
.PHONY: distclean-generated
