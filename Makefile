FILE = "cv.tex"
MAJOR = "0"
MINOR = "1"
PATCH = `date +%Y%m%d%H%M`

all: build commit

build:
	@lualatex $(FILE)

commit: build
	@git add .
	@git commit -m "Update $(FILE) $(PATCH)"
	@git push
	@git tag -a v$(MAJOR).$(MINOR).$(PATCH) -m "Update $(FILE) $(PATCH)"
	@git push --tags