#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/arch-grub
LIB_DIR=$(DESTDIR)$(PREFIX)/lib

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard arch-grub/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-scripts install-doc

install-scripts:

	install -vDm 755 arch-grub/arch-grub.sh "$(BIN_DIR)/arch-grub"
	install -vDm 644 configs/grub-embed.cfg "$(BIN_DIR)/grub-embed.cfg"

install-doc:
	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

.PHONY: check install install-doc install-scripts shellcheck
