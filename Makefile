FILE = "cv.tex"
DATE = date +%Y%m%d%H%M
MAJOR = "0"
MINOR = "1"
PATCH = $(date +%Y%m%d%H%M)

all: build commit

build:
	@lualatex $(FILE)

commit: build
	@git add .
	@git commit -m "Update $(FILE) $(DATE)"
	@git push
	@git tag -a $(MAJOR).$(MINOR).$(PATCH) -m "Update $(FILE) $(DATE)"
	@git push --tags