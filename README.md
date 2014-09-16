OpenWrt-Extra
=============

Some extra packages for OpenWrt

Add "src-git extra git://github.com/mtyzaq/extra.git" to feeds.conf.default.

```bash
./scripts/feeds update -a
./scripts/feeds install -a
```

the list of packages:
* ChinaDNS-C
* cpulimit
* dnscrypt-proxy
* exfat-nofuse
* gevent
* goagent
* mwan3
* mwan3-luci
* nodejs
* python-greenlet
* redsocks2
* shadowsocks-libev
* webui-aria2
* xunlei
* yaaw

the list of luci
* luci-app-aira2
* luci-app-cpulimit
* luci-app-dnsfilter
* luci-app-goagent
* luci-app-macvlan
* luci-app-pdnsd
* luci-app-pptpd
* luci-app-redsocks2
* luci-app-shadowsocks
* luci-app-usb-printer
* luci-app-vsftpd
* luci-app-webshell

the list of libs
* libsodium (depended by dnscrypt-proxy, but have no ipk)

