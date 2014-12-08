# This file is part of MXE.
# See index.html for further information.

PKG             := instantclient-basiclite-nt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 12.1.0.2.0
$(PKG)_CHECKSUM := 32ded509ca5264b430cb48603f3076552b2b1a456e249677e750988693065f56
$(PKG)_SUBDIR   := instantclient_12_1
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).zip
$(PKG)_URL       = http://mabrand.nl/$(PKG)-$($(PKG)_VERSION).zip
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    echo 'not implemented'
endef

define $(PKG)_BUILD_i686-w64-mingw32
    $(INSTALL) -d '$(PREFIX)/$(TARGET)/bin/'
    $(INSTALL) -m644 '$(1)/'*.dll '$(PREFIX)/$(TARGET)/bin/'
endef
