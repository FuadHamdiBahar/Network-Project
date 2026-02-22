ena
conf t
hostname CSR3

int gi1
no shut
ip addr 10.1.3.3 255.255.255.0
ip ospf 1 area 0

int gi2
no shut
ip addr 10.2.3.3 255.255.255.0
ip ospf 1 area 0

int gi3
no shut
ip addr 10.3.4.3 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip addr 3.3.3.3 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 3.3.3.3
mpls ldp autoconfig