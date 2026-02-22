ena
conf t
hostname CSR4

int gi1
no shut
ip addr 10.4.5.4 255.255.255.0
ip ospf 1 area 0

int gi3
no shut
ip addr 10.3.4.4 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip addr 4.4.4.4 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 4.4.4.4
mpls ldp autoconfig

l2 vfi 3821 manual
vpn id 3821
    mtu 1998
    bridge-domain 3821
    neighbor 1.1.1.1 encapsulation mpls
    neighbor 2.2.2.2 encapsulation mpls
    neighbor 5.5.5.5 encapsulation mpls
    