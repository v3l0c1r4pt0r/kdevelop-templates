TEMPLATES=article
GOALS=$(addsuffix .$(EXT),$(TEMPLATES))
all: $(GOALS)
%.$(EXT): $(TEMPLATES:.$(EXT)=)
	cd $</; tar $(CMD) -cvf ../$@ ./*
$(TEMPLATES:.$(EXT)=): $(TEMPLATES:.$(EXT)=)/$(TEMPLATES:.$(EXT)=).desktop
clean:
	rm -f $(GOALS)
