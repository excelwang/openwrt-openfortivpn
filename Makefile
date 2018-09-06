
include $(TOPDIR)/rules.mk

PKG_SOURCE_URL:=https://github.com/adrienverge/openfortivpn
PKG_SOURCE_VERSION:=467cab7

PKG_NAME:=openfortivpn
PKG_VERSION:=1.7.1_git$(PKG_SOURCE_VERSION)
PKG_RELEASE:=1
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_SOURCE_PROTO:=git

include $(INCLUDE_DIR)/package.mk

define Package/openfortivpn
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A Fortinet compatible client for PPP+SSL VPN tunnel services
  URL:=https://github.com/adrienverge/openfortivpn
  SUBMENU:=VPN
  DEPENDS:=+libopenssl +resolveip +ppp 
endef

define Build/Compile
		cd $(PKG_BUILD_DIR) && ./autogen.sh
		cd $(PKG_BUILD_DIR) && ./configure --prefix=/usr/local --sysconfdir=/etc
		$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		INSTALL_PROG=":"
endef

define Package/openfortivpn/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openfortivpn $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,openfortivpn))
