FILE = "cv.tex"
MAJOR = "0"
MINOR = "1"

# if os is windows
ifeq ($(OS),Windows_NT)
	PATCH = $(shell Get-Date -Format "MMddyyyyHHmmK")
else
	PATCH = $(shell date +%m%d%Y%H%M%Z)
endif

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