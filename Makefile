
PREFIX := /usr/local
SRC := $(wildcard *.sh)
OBJ := $(patsubst %.sh, $(PREFIX)/bin/%, $(SRC))

.PHONY: all
all:
	@echo "Run 'make install' to install all scripts."
	@echo
	@echo "Run 'make install_SCRIPT' to install individual scripts."
	@echo "For example: 'make install_fgb' to install the fgb.sh script."

## install : Install all scripts.
.PHONY: install
install: $(patsubst %.sh, install_%, $(SRC))
	@echo
	@echo "Finished installing fzf-bin!"

## uninstall : Uninstall all scripts.
.PHONY: uninstall
uninstall: $(OBJ)
	@echo "Uninstalling fzf-bin..."
	@rm -vf $(OBJ)

## install_SCRIPT : Install individual script.
install_%: %.sh
	@echo "Installing $@..."
	@cp -vp $< $(PREFIX)/bin/$(basename $<)
	@chmod 755 $(PREFIX)/bin/$(basename $<)

## uninstall_SCRIPT : Uninstall individual script.
uninstall_%: $(PREFIX)/bin/%
	@echo "Uninstalling $<..."
	@rm -vf $<

## variables : Print variables.
.PHONY: variables
variables:
	@echo PREFIX: $(PREFIX)
	@echo SRC: $(SRC)
	@echo OBJ: $(OBJ)

.PHONY: help
help: Makefile
	@sed -n 's/^## //p' $< | awk -F':' '{printf "%-30s: %s\n", $$1, $$2'}
