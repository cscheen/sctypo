.DEFAULT_GOAL := serve

help: ## Show all Makefile targets with help messages
	@echo ">>> make help: Showing all Makefile targets with help messages..."
	@grep --extended-regexp '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo "... done."

ginit: ## Initialize Git repository in current directory
	@if [ -d ".git/" ]; then \
	    echo ">>> make ginit: Doing nothing (Git repository already initialized)..."; \
	    git status --short; \
	else \
	    echo ">>> make ginit: Initializing Git repository in current directory..."; \
	    git init --quiet; \
	    git branch --move main; \
	    git add .; \
	    git commit --message="Initial commit" --quiet; \
	    git status; \
	fi
	@echo "... done."

clean: ## Purge public/ and resources/ subdirectories
	@echo ">>> make clean: Purging public/ and resources/ subdirectories..."
	@rm --dir --force --recursive public/
	@rm --dir --force --recursive resources/
	@echo "... done."

fonts: ## Make *.woff* Web fonts from ttf/ subdirectory
	@echo ">>> make fonts: Making *.woff* Web fonts from ttf/ subdirectory..."
	@cp --force ttf/OFL.txt static/webfonts/OFL.txt.Ysabeau
	@cp --force ttf/Ysabeau-Medium.ttf static/webfonts/
	@cp --force ttf/Ysabeau-MediumItalic.ttf static/webfonts/
	@cp --force ttf/Ysabeau-Bold.ttf static/webfonts/
	@cp --force ttf/Ysabeau-BoldItalic.ttf static/webfonts/
	@cp --force ttf/LICENSE.Fira static/webfonts/
	@cp --force ttf/FiraMono-Regular.ttf static/webfonts/
	@cp --force ttf/FiraMono-Bold.ttf static/webfonts/
	@cp --force ttf/LICENSE.Feather static/webfonts/
	@cp --force ttf/feather.ttf static/webfonts/
	@for ttffile in static/webfonts/*.ttf; \
	do \
	    sfnt2woff-zopfli $$ttffile; \
	    woff2_compress $$ttffile; \
	    rm --force $$ttffile; \
	done
	@echo "... done."

build: ginit clean ## Build and publish site in public/ subdirectory
	@echo ">>> make build: Building and publishing site in public/ subdirectory..."
	@hugo --enableGitInfo --environment production --gc --minify --verbose
	@echo "... done."

serve: ginit clean ## Build and serve site with Hugo’s Web server
	@echo ">>> make serve: Building and serving site with Hugo’s Web server..."
	@hugo server --buildDrafts --disableFastRender --enableGitInfo --environment production --gc --ignoreCache --verbose --watch
	@echo "... done."
