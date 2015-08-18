TEMPLATES=
GOALS=$(addsuffix .$(EXT),$(TEMPLATES))
all: $(GOALS)
%.$(EXT): $(TEMPLATES:.$(EXT)=)
	cd $</; tar $(CMD) -cvf ../$@ ./*
clean:
	rm -f $(GOALS)
