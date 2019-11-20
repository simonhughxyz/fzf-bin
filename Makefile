
PREFIX := /usr/local/bin
SRC := $(wildcard *.sh)
OBJ := $(patsubst %.sh, $(PREFIX)/%, $(SRC))


all:
	@echo "Run 'make install' to install fzf-bin."

## install	: Install fzf-bin.
install: $(basename $(SRC))
	@echo
	@echo "Finished installing fzf-bin!"

## uninstall	: Uninstall fzf-bin.
uninstall: $(OBJ)
	@echo "Uninstalling fzf-bin..."
	@rm -vf $(OBJ)

%: %.sh
	@echo "Installing $@..."
	@cp -p $< $(PREFIX)/$@
	@chmod 755 $(PREFIX)/$@

## variables	: Print variables.
variables:
	@echo PREFIX: $(PREFIX)
	@echo SRC: $(SRC)
	@echo OBJ: $(OBJ)

help: Makefile
	@sed -n 's/^##//p' $<
