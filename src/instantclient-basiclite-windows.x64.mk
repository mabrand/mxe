# This file is part of MXE.
# See index.html for further information.

PKG             := instantclient-basiclite-windows.x64
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(instantclient-basiclite-nt_VERSION)
$(PKG)_CHECKSUM := 963c84e0140914c41f483711ea0656637a3ba51e95e51cbdfcd877a4ea916d28
$(PKG)_SUBDIR    = $(instantclient-basiclite-nt_SUBDIR)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).zip
$(PKG)_URL       = http://mabrand.nl/$(PKG)-$($(PKG)_VERSION).zip
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    echo 'not implemented'
endef

$(PKG)_BUILD_x86_64-w64-mingw32 = $(instantclient-basiclite-nt_BUILD_i686-w64-mingw32)
