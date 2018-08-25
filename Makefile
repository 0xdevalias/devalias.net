.PHONY: list serve serve-drafts build deploy publish outdated

list:
	@echo "Usage (Quick):"
	@echo	"  make build"
	@echo	"  make deploy"
	@echo
	@echo "Usage (Makefile):"
	@grep '^[^#[:space:]].*:' Makefile
	@echo
	@echo "Usage (./bin):"
	@ls ./bin

serve:
	./bin/serve

serve-drafts:
	./bin/serve-drafts

build:
	./bin/build

deploy:
	./bin/deploy

publish:
	bundle exec jekyll publish "$1"

outdated:
	bundle outdated
