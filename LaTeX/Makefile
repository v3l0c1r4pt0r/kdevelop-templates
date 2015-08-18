FIL_TEMPLATES=article
PRO_TEMPLATES=
GOALS=$(addsuffix .$(EXT),$(FIL_TEMPLATES)) $(addsuffix .$(EXT),$(PRO_TEMPLATES))
all: $(GOALS)
%.$(EXT): $(FIL_TEMPLATES:.$(EXT)=) $(PRO_TEMPLATES:.$(EXT)=)
	cd $</; tar $(CMD) -cvf ../$@ ./*
$(FIL_TEMPLATES:.$(EXT)=): $(FIL_TEMPLATES:.$(EXT)=)/$(FIL_TEMPLATES:.$(EXT)=).desktop
$(PRO_TEMPLATES:.$(EXT)=): $(PRO_TEMPLATES:.$(EXT)=)/$(PRO_TEMPLATES:.$(EXT)=).kdevtemplate
clean:
	rm -f $(GOALS)
