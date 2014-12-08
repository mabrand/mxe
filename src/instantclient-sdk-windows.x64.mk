# This file is part of MXE.
# See index.html for further information.

PKG             := instantclient-sdk-windows.x64
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(instantclient-sdk-nt_VERSION)
$(PKG)_CHECKSUM := 08381b0a3c2996be5acdc074c2c0cc5933c0ecc54cc801a384f491dc94532d50
$(PKG)_SUBDIR    = $(instantclient-sdk-nt_SUBDIR)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).zip
$(PKG)_URL       = http://mabrand.nl/$(PKG)-$($(PKG)_VERSION).zip
$(PKG)_DEPS     := binutils gendef instantclient-basiclite-windows.x64

define $(PKG)_UPDATE
    echo 'not implemented'
endef

$(PKG)_BUILD_x86_64-w64-mingw32 = $(instantclient-sdk-nt_BUILD_i686-w64-mingw32)
