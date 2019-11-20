
PREFIX := /usr/local/bin
SRC := $(wildcard *.sh)
OBJ := $(patsubst %.sh, $(PREFIX)/%, $(SRC))

.PHONY: all
all:
	@echo "Run 'make install' to install fzf-bin."

## install	: Install fzf-bin.
.PHONY: install
install: $(basename $(SRC))
	@echo
	@echo "Finished installing fzf-bin!"

## uninstall	: Uninstall fzf-bin.
.PHONY: uninstall
uninstall: $(OBJ)
	@echo "Uninstalling fzf-bin..."
	@rm -vf $(OBJ)

%: %.sh
	@echo "Installing $@..."
	@cp -vp $< $(PREFIX)/$@
	@chmod 755 $(PREFIX)/$@

## variables	: Print variables.
variables:
	@echo PREFIX: $(PREFIX)
	@echo SRC: $(SRC)
	@echo OBJ: $(OBJ)

.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<
