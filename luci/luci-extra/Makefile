include $(TOPDIR)/rules.mk

LUCI_TOPDIR=..

PKG_NAME:=luci-extra
PKG_RELEASE:=1

PKG_BUILD_PARALLEL:=0

PKG_VERSION:=2014-09-04

PKG_BUILD_DEPENDS:=$(if $(STAGING_DIR_ROOT),lua/host)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

LUA_TARGET:=source
LUCI_CFLAGS:=
LUCI_BUILD_PACKAGES:=
LUCI_SELECTED_MODULES:=

ifeq ($(BOARD),brcm-2.4)
  MAKE_FLAGS += CRAP="1"
endif


### Templates ###
define Package/luci/install/template
	$(CP) -a $(PKG_BUILD_DIR)/$(2)/dist/* $(1)/ -R
	$(CP) -a $(PKG_BUILD_DIR)/$(2)/ipkg/* $(1)/CONTROL/ 2>/dev/null || true
endef

### Applications ###
define application
  define Package/luci-app-$(1)
    SECTION:=luci
    CATEGORY:=LuCI
    TITLE:=LuCI - Lua Configuration Interface
    URL:=https://github.com/nanpuyue/openwrt-extra/
    MAINTAINER:=nanpuyue <nanpuyue@gmail.com>
    PKGARCH:=all
    SUBMENU:=3. Applications
    TITLE:=$(if $(2),$(2),LuCI $(1) application)
	DEPENDS:=$(3)
  endef

  define Package/luci-app-$(1)/install
	$(call Package/luci/install/template,$$(1),applications/luci-$(1))
  endef

  ifneq ($(CONFIG_PACKAGE_luci-app-$(1)),)
    LUCI_SELECTED_MODULES+=applications/luci-$(1)
  endif

  LUCI_BUILD_PACKAGES += luci-app-$(1)
endef

define Package/luci-app-aria2/conffiles
/etc/config/aria2
endef

$(eval $(call application,aria2,LuCI Support for Aria2,\
	+PACKAGE_luci-app-aria2:aria2 \
	+PACKAGE_luci-app-aria2:yaaw))

$(eval $(call application,goagent,GoAgent Proxy,\
	+PACKAGE_luci-app-goagent:goagent))

$(eval $(call application,shadowsocks,LuCI Support for shadowsocks,\
	+PACKAGE_luci-app-shadowsocks:shadowsocks-libev \
	+PACKAGE_luci-app-shadowsocks:ipset \
	+PACKAGE_luci-app-shadowsocks:resolveip \
	+PACKAGE_luci-app-shadowsocks:ChinaDNS-C))

$(eval $(call application,redsocks2,LuCI Support for redsocks2,\
	+PACKAGE_luci-app-redsocks2:redsocks2 \
	+PACKAGE_luci-app-redsocks2:ipset \
	+PACKAGE_luci-app-shadowsocks:resolveip))

$(eval $(call application,vsftpd,FTP Server,\
	+PACKAGE_luci-app-vsftpd:vsftpd-pam))

$(eval $(call application,pptpd,LuCI Support for pptpd,\
	+PACKAGE_luci-app-pptpd:pptpd))

$(eval $(call application,usb-printer,USB Printer Share via TCP/IP,\
	+PACKAGE_luci-app-usb-printer:p910nd))

$(eval $(call application,macvlan,LuCI Support for macvlan,\
	+PACKAGE_luci-app-macvlan:kmod-macvlan +PACKAGE_luci-app-macvlan:luci-app-mwan3))

$(eval $(call application,cpulimit,CPULIMIT configuration module,\
	 +PACKAGE_luci-app-cpulimit:cpulimit))

$(eval $(call application,pdnsd,LuCI Support for pdnsd,\
	+PACKAGE_luci-app-pdnsd:pdnsd))

$(eval $(call application,dnsfilter,DNS-Filter LuCI configuration module,\
	+PACKAGE_luci-app-dnsfilter:libc \
	++PACKAGE_luci-app-dnsfilter:bash \
	+PACKAGE_luci-app-dnsfilter:screen \
	+PACKAGE_luci-dnsfilter:wget))

$(eval $(call application,webshell,webshell configuration module,\
	 +PACKAGE_luci-app-webshell))

### Compile ###
PKG_CONFIG_DEPENDS=$(patsubst %,CONFIG_PACKAGE_%,$(LUCI_BUILD_PACKAGES))

include $(INCLUDE_DIR)/package.mk

define Build/Prepare
	@if [ ! -x $(LUCI_TOPDIR)/build/mkrevision.sh ]; then \
		echo "*** Repository layout changed!" >&2; \
		echo "*** Please change the LuCI url in feeds.conf to http://svn.luci.subsignal.org/luci/trunk and reinstall the feed with" >&2; \
		echo "*** ./scripts/feeds update luci; ./scripts/feeds install -a -p luci" >&2; \
		exit 1; \
	fi
	mkdir -p $(PKG_BUILD_DIR)
	$(TAR) c -C $(LUCI_TOPDIR) . \
		--exclude=.pc --exclude=.svn --exclude=.git \
		--exclude='boa-0*' --exclude='*.o' --exclude='*.so' \
		--exclude=dist | \
			tar x -C $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

MAKE_FLAGS += \
	MODULES="$(LUCI_SELECTED_MODULES)" \
	LUA_TARGET="$(LUA_TARGET)" \
	LUA_SHLIBS="-llua -lm -ldl -lcrypt" \
	CFLAGS="$(TARGET_CFLAGS) $(LUCI_CFLAGS) -I$(STAGING_DIR)/usr/include" \
	LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \
	NIXIO_TLS="$(NIXIO_TLS)" OS="Linux"


$(foreach b,$(LUCI_BUILD_PACKAGES),$(eval $(call BuildPackage,$(b))))
