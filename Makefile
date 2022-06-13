FILE = "cv.tex"

all: build commit

build:
	lualatex $(FILE)

commit: build
	git add .
	git commit -m "Update CV on $(date +%d-%m-%Y-%H-%M)"
	git push
	git tag -a "cv-$(date +%d-%m-%Y-%H-%M)" -m "cv-$(date +%d-%m-%Y-%H-%M)"
	git push --tags