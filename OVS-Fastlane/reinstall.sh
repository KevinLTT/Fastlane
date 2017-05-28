#!/bin/sh
kill -9 `ps -A | grep ovs | head -n1 | awk '{print $1;}'`
kill -9 `ps -A | grep ovs | head -n1 | awk '{print $1;}'`
ovs-dpctl del-dp system@ovs-system
rm -rf /usr/local/etc/openvswitch
rm -rf /usr/local/var/run/openvswitch

make uninstall

./boot.sh
./configure --prefix=/usr --with-linux=/lib/modules/`uname -r`/build
make 
make install
modprobe nf_conntrack
modprobe nf_nat
modprobe nf_defrag_ipv6
modprobe libcrc32c
modprobe nf_nat_ipv6
modprobe gre
modprobe nf_nat_ipv4
make modules_install
rmmod openvswitch
depmod -a

/etc/init.d/openvswitch-controller stop
update-rc.d openvswitch-controller disable
/etc/init.d/openvswitch-switch start