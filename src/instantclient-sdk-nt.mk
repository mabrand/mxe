# This file is part of MXE.
# See index.html for further information.

PKG             := instantclient-sdk-nt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(instantclient-basiclite-nt_VERSION)
$(PKG)_CHECKSUM := 69518ce10a9a6da62e4684f1b1ef8f95b419b309e0d2d10c0ed8ecd90bbc2530
$(PKG)_SUBDIR    = $(instantclient-basiclite-nt_SUBDIR)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).zip
$(PKG)_URL       = http://mabrand.nl/$(PKG)-$($(PKG)_VERSION).zip
$(PKG)_DEPS     := binutils gendef instantclient-basiclite-nt

define $(PKG)_UPDATE
    echo 'not implemented'
endef

define $(PKG)_BUILD_i686-w64-mingw32
    cd '$(1)' && $(PREFIX)/$(TARGET)/bin/gendef '$(PREFIX)/$(TARGET)/bin/oci.dll'
    cd '$(1)' && $(TARGET)-dlltool -D '$(PREFIX)/$(TARGET)/bin/oci.dll' -d oci.def  -l liboci.a
    $(INSTALL) -d '$(PREFIX)/$(TARGET)/include/' '$(PREFIX)/$(TARGET)/lib/'
    $(INSTALL) -m644 '$(1)/sdk/include/'*.h '$(PREFIX)/$(TARGET)/include/'
    $(INSTALL) -m644 '$(1)/liboci.a' '$(PREFIX)/$(TARGET)/lib/'
endef
