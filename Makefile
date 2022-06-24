FILE = "cv.tex"
MAJOR = "0"
MINOR = "1"
PATCH = "1"

.PHONY: all
all: build commit

build:
	@xelatex $(FILE)

commit:
	@git add .
	@git commit -m "Update $(FILE) $(PATCH)"
	@git push
	@git tag -a v$(MAJOR).$(MINOR).$(PATCH) -m "Update $(FILE) $(PATCH)"
	@git push --tags