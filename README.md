# openwrt-openfortivpn
OpenWRT package for [openfortivpn: A Fortinet (and Ruijie) compatible client for PPP+SSL VPN tunnel services](https://github.com/adrienverge/openfortivpn)

## Build
Example for ar71xx and trunk.
```
wget http://downloads.openwrt.org/snapshots/trunk/ar71xx/generic/OpenWrt-SDK-ar71xx-generic_gcc-4.8-linaro_musl-1.1.11.Linux-x86_64.tar.bz2
tar jxf OpenWrt-SDK-ar71xx-generic_gcc-4.8-linaro_musl-1.1.11.Linux-x86_64.tar.bz2
cd OpenWrt-SDK-ar71xx-generic_gcc-4.8-linaro_musl-1.1.11.Linux-x86_64/package
git clone https://github.com/excelwang/openwrt-openfortivpn openfortivpn
cd ..
./scripts/feeds update base
./scripts/feeds install libopenssl resolveip ppp
make package/openfortivpn/compile V=s
```
