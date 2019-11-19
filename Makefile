
PREFIX := /usr/local/bin

all:
	@echo "Run 'make install' to install fzf-bin."

install:
	@echo "Installing fzf-bin..."
	@cp -p fdot $(PREFIX)/fdot
	@chmod 755 $(PREFIX)/fdot
