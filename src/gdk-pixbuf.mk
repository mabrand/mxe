# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gdk-pixbuf
$(PKG)_WEBSITE  := https://gtk.org/
$(PKG)_DESCR    := GDK-pixbuf
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.42.12
$(PKG)_CHECKSUM := b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7
$(PKG)_SUBDIR   := gdk-pixbuf-$($(PKG)_VERSION)
$(PKG)_FILE     := gdk-pixbuf-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://download.gnome.org/sources/gdk-pixbuf/$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_FILE)
$(PKG)_DEPS     := cc meson-wrapper glib jasper jpeg libiconv libpng tiff

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://gitlab.gnome.org/GNOME/gdk-pixbuf/tags' | \
    $(SED) -n "s,.*<a [^>]\+>v\?\([0-9]\+\.[0-9.]\+\)<.*,\1,p" | \
    grep -v '^2\.9' | \
    head -1
endef

define $(PKG)_BUILD
    LDFLAGS="`'$(TARGET)-pkg-config' --libs libjpeg libpng libtiff-4`" \
    '$(MXE_MESON_WRAPPER)' $(MXE_MESON_OPTS) \
      -Dinstalled_tests=false \
      -Dintrospection=disabled \
      -Dman=false \
      $(if $(BUILD_STATIC),-Dbuiltin_loaders=all) \
    '$(BUILD_DIR)' '$(SOURCE_DIR)'
    '$(MXE_NINJA)' -C '$(BUILD_DIR)' -j '$(JOBS)'
    '$(MXE_NINJA)' -C '$(BUILD_DIR)' -j '$(JOBS)' install
endef
