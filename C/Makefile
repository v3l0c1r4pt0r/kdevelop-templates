FIL_TEMPLATES=
PRO_TEMPLATES=ESP8266
FIL_GOALS=$(addsuffix .$(EXT),$(FIL_TEMPLATES))
PRO_GOALS=$(addsuffix .$(EXT),$(PRO_TEMPLATES))
GOALS=$(FIL_GOALS) $(PRO_GOALS)
all: $(GOALS)
%.$(EXT): $(FIL_TEMPLATES:.$(EXT)=) $(PRO_TEMPLATES:.$(EXT)=)
	cd $</; tar $(CMD) -cvf ../$@ ./*
$(FIL_TEMPLATES:.$(EXT)=): $(FIL_TEMPLATES:.$(EXT)=)/$(FIL_TEMPLATES:.$(EXT)=).desktop
$(PRO_TEMPLATES:.$(EXT)=): $(PRO_TEMPLATES:.$(EXT)=)/$(PRO_TEMPLATES:.$(EXT)=).kdevtemplate
install: install-fil install-pro
install-pro:
ifneq ($(PRO_TEMPLATES),)
	cp $(PRO_GOALS) $(PREFIX)/$(PRO_PATH)
endif
install-fil:
ifneq ($(FIL_TEMPLATES),)
	cp $(FIL_GOALS) $(PREFIX)/$(FIL_PATH)
endif
clean:
	rm -f $(GOALS)
