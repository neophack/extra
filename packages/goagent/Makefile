#
# Copyright (C) 2007-2013 OpenWrt.org
# Copyright (C) 2014 NowRush Studio <hackpascal@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/version.mk

PKG_NAME:=goagent
PKG_VERSION:=3.1.17
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/goagent
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+python +pyopenssl +gevent
  TITLE:=GoAgent Proxy
  VERSION:=$(PKG_VERSION)
endef

define Package/goagent/conffiles
/etc/goagent/CA.crt
/etc/goagent/proxy.pac
/etc/config/goagent
endef

define Package/goagent/description
 GoAgent is a proxy tool to break the GFW.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/goagent/install
	$(INSTALL_DIR) $(1)
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/goagent
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/usr/lib/goagent
	$(INSTALL_DIR) $(1)/CONTROL

	$(INSTALL_BIN) ./files/usr/lib/goagent/genproxyini $(1)/usr/lib/goagent
	$(INSTALL_BIN) ./files/usr/lib/goagent/goagent_wrapper $(1)/usr/lib/goagent
	$(INSTALL_BIN) ./files/usr/lib/goagent/proxy.py $(1)/usr/lib/goagent
	$(INSTALL_DATA) ./files/usr/lib/goagent/dnslib-0.8.3.egg $(1)/usr/lib/goagent
	$(INSTALL_CONF) ./files/etc/config/goagent $(1)/etc/config
	$(INSTALL_DATA) ./files/etc/goagent/* $(1)/etc/goagent
	$(INSTALL_BIN) ./files/etc/init.d/goagent $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/uci-defaults/luci-goagent $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./ipkg/postinst $(1)/CONTROL/postinst
endef

$(eval $(call BuildPackage,goagent))
