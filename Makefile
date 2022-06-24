FILE = "cv.tex"
MAJOR = "0"
MINOR = "1"
PATCH = "0"
BUILD = "2"

.PHONY: all
all: build commit

build:
	@lualatex $(FILE)

commit:
	@git add .
	@git commit -m "Update $(FILE) $(MAJOR).$(MINOR).$(PATCH)-rc$(BUILD)"	
	@git push
	@git tag -a v$(MAJOR).$(MINOR).$(PATCH)-rc$(BUILD) -m "Update $(FILE) $(PATCH)"
	@git push --tags