# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qtgamepad
$(PKG)_WEBSITE  := https://www.qt.io/
$(PKG)_DESCR    := Qt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := fa5cb5feda4161239827dd7ae01ee7747cccf4edc9668433d45cb30ce02d115c
$(PKG)_SUBDIR    = $(subst qtbase,qtgamepad,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtgamepad,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtgamepad,$(qtbase_URL))
$(PKG)_DEPS     := cc qtbase qtdeclarative

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
