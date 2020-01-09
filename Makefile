MAKEFLAGS += k

.PHONY: test compile clean lint prepare clean-start

.ONESHELL:

compile: prepare
	cask exec emacs -Q -batch -L . -f batch-byte-compile *.el

.cask: Cask
	@echo Updating external dependencies...
	@cask install
	@cask update
	@touch .cask

prepare: .cask

clean:
	@rm -f ./*.elc

lint: compile
	@rm -rf ./*elc
