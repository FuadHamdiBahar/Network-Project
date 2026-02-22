ena
conf t
hostname CSR2

int gi2
no shut
ip addr 10.2.3.2 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip addr 2.2.2.2 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 2.2.2.2
mpls ldp autoconfig

l2 vfi 3821 manual
vpn id 3821
neighbor 4.4.4.4 encapsulation mpls
bridge-domain 3821
mtu 1998

int gi4
no shut
mtu 1998
service instance 3821 ethernet
    description "Link to Site 2"
    encapsulation dot1q 3821
    rewrite ingress tag pop 1 symmetric
    bridge-domain 3821