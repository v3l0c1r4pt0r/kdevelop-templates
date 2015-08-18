export TAR=tar
# compress as bzip2
export CMD=-j
export EXT=tar.bz2
SUBDIRS=C LaTeX

all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@
clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $@; \
	done
.PHONY: $(SUBDIRS) clean
