export TAR=tar
# compress as bzip2
export CMD=-j
export EXT=tar.bz2
SUBDIRS=C LaTeX
# installation directories
export PREFIX?=~/.kde4
export PRO_PATH=share/apps/kdevappwizard/templates/
export FIL_PATH=share/apps/kdevfiletemplates/templates/

define foreachsubdir
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $1; \
	done
endef

all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@
install:
	$(call foreachsubdir,$@)
clean:
	$(call foreachsubdir,$@)
.PHONY: $(SUBDIRS) clean
