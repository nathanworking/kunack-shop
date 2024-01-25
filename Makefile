include .env

.PHONY: build dev pull up install

build: up
	ddev exec yarn build
dev: build
	ddev exec yarn serve
serve: up
	ddev exec yarn serve
backup: 
	ddev exec php craft db/backup
import: 
	ddev import-db --file=./storage/backups/latest.sql
license: up 
	ddev exec php craft setup/app-id \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft setup/security-key \
		$(filter-out $@,$(MAKECMDGOALS))
install: up build
	ddev exec php craft setup/app-id \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft setup/security-key \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft plugin/install aws-s3
	ddev exec php craft plugin/install cp-field-inspect
	ddev exec php craft plugin/install postmark
	ddev exec php craft plugin/install redactor
	ddev exec php craft plugin/install vite
	ddev exec php craft plugin/install knock-knock
	ddev exec php craft plugin/install typedlinkfield
	ddev exec php craft plugin/install feed-me
	ddev exec php craft plugin/install sprig
	ddev exec php craft plugin/install empty-coalesce
	ddev exec php craft plugin/install secrets
	ddev exec php craft plugin/install minify
	ddev exec php craft plugin/install eager-beaver
	ddev exec php craft plugin/install formie
	ddev exec php craft plugin/install blitz
	ddev exec php craft plugin/install image-optimize
	ddev exec php craft plugin/install seomatic
	ddev exec php craft plugin/install typogrify
	ddev exec php craft plugin/install environment-label
	ddev exec php craft plugin/install async-queue
	ddev exec php craft plugin/install retour
	ddev exec php craft plugin/install retcon
	ddev exec php craft plugin/install neo
	ddev exec php craft plugin/install field-manager
up:
	if [ ! "$$(ddev describe | grep OK)" ]; then \
        ddev auth ssh; \
        ddev start; \
    fi
%:
	@:
# ref: https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line