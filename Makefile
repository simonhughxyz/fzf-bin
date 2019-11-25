PREFIX := /usr/local
SRC_PREFIX := ./src
SRC := $(patsubst $(SRC_PREFIX)/%, %, $(wildcard ./src/*.sh))
INSTALL_PATH := $(patsubst %.sh, $(PREFIX)/bin/%, $(SRC))

.PHONY: all
all:
	@echo "Run 'make install' to install all scripts."
	@echo
	@echo "Run 'make install_SCRIPT' to install individual scripts."
	@echo "For example: 'make install_$(word 1, $(SRC))' to install the $(word 1, $(SRC)) script."

## install : Install all scripts.
.PHONY: install
install: $(patsubst %, install_%, $(SRC))
	@echo
	@echo "Finished installing fzf-bin!"

## uninstall : Uninstall all scripts.
.PHONY: uninstall
uninstall: $(INSTALL_PATH)
	@echo "Uninstalling fzf-bin..."
	@rm -vf $(INSTALL_PATH)

## install_SCRIPT : Install individual script.
install_%: $(SRC_PREFIX)/%
	@echo "Installing $@..."
	@cp -vp $< $(PREFIX)/bin/$(notdir $(basename $<))
	@chmod 755 $(PREFIX)/bin/$(notdir $(basename $<))

## uninstall_SCRIPT : Uninstall individual script.
uninstall_%: $(PREFIX)/bin/%
	@echo "Uninstalling $<..."
	@rm -vf $<

## variables : Print variables.
.PHONY: variables
variables:
	@echo SRC_PREFIX: $(SRC_PREFIX)
	@echo PREFIX: $(PREFIX)
	@echo SRC: $(SRC)
	@echo INSTALL_PATH: $(INSTALL_PATH)

.PHONY: help
help: Makefile
	@sed -n 's/^## //p' $< | awk -F':' '{printf "%-30s: %s\n", $$1, $$2'}
