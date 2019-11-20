
PREFIX := /usr/local/bin
SRC := $(wildcard *.sh)
OBJ := $(patsubst %.sh, $(PREFIX)/%, $(SRC))



all:
	@echo "Run 'make install' to install fzf-bin."

%: %.sh
	@echo "Installing $@..."
	@cp -p $< $(PREFIX)/$@
	@chmod 755 $(PREFIX)/$@

install: $(SRC:.sh=)
	@echo
	@echo "Finished installing fzf-bin!"

uninstall: $(OBJ)
	@echo "Uninstalling fzf-bin..."
	@rm -vf $(OBJ)
