IMFIX_SRC = src/sublime-imfix.c
CFLAGS=-shared -fPIC `pkg-config --libs --cflags gtk+-2.0`
OBJ=libsublime-imfix.so
DESKTOP_ENTRY=src/sublime_text.desktop
CC=gcc
DESTDIR=/usr
SCRIPT=src/subl
SUBLIME_TEXT_DIR=/opt/sublime_text

.PHONY: all install

all:
	$(CC) $(IMFIX_SRC) -o $(OBJ) $(CFLAGS)

install:
	install -m 0755 $(OBJ) $(SUBLIME_TEXT_DIR)
	install -m 0655 $(DESKTOP_ENTRY) $(DESTDIR)/share/applications/
	install -m 0755 $(SCRIPT) $(DESTDIR)/bin/sublime_text