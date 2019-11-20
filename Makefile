
PREFIX := /usr/local/bin
SRC := $(wildcard *.sh)
OBJ := $(patsubst %.sh, $(PREFIX)/%, $(SRC))

.PHONY: all
all:
	@echo "Run 'make install' to install all scripts."
	@echo
	@echo "Run 'make SCRIPT' to install individual scripts."
	@echo "For example: 'make fgb' to install the fgb script."

## install		: Install all scripts.
.PHONY: install
install: $(basename $(SRC))
	@echo
	@echo "Finished installing fzf-bin!"

## uninstall		: Uninstall all scripts.
.PHONY: uninstall
uninstall: $(OBJ)
	@echo "Uninstalling fzf-bin..."
	@rm -vf $(OBJ)

## SCRIPT			: Install individual script.
%: %.sh
	@echo "Installing $@..."
	@cp -vp $< $(PREFIX)/$@
	@chmod 755 $(PREFIX)/$@

## uninstall_SCRIPT	: Uninstall individual script.
uninstall_%: $(PREFIX)/%
	@echo "Uninstalling $<..."
	@rm -vf $<

## variables		: Print variables.
.PHONY: variables
variables:
	@echo PREFIX: $(PREFIX)
	@echo SRC: $(SRC)
	@echo OBJ: $(OBJ)

.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<
