#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-xunlei
PKG_VERSION:=0.11
PKG_RELEASE:=14
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  DEPENDS:=+wget
  TITLE:=LuCI Support for XunLei downloading app.
  PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
 xware web UI
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh 
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-xunlei ) && rm -f /etc/uci-defaults/luci-xunlei
	/etc/init.d/xunlei enable >/dev/null 2>&1
	exit 0
}
endef

define Package/$(PKG_NAME)/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
