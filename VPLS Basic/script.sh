----------PE1----------
ena
conf t
hostname PE1

int e1/0
no shut
ip addr 172.16.1.1 255.255.255.252
ip ospf 1 area 0

int loop0
no shut
ip addr 1.1.1.1 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 1.1.1.1
mpls ldp autoconfig

----------P1----------
ena
conf t
hostname P1

int e1/0
no shut
ip addr 172.16.1.2 255.255.255.252
ip ospf 1 area 0

int e1/1
no shut
ip addr 172.16.1.5 255.255.255.252
ip ospf 1 area 0

int Loopback0
 ip addr 2.2.2.2 255.255.255.255
 ip ospf 1 area 0
!

router ospf 1
router-id 2.2.2.2
mpls ldp autoconfig

----------P2----------
ena
conf t
hostname P2

int e1/1
no shut
ip addr 172.16.1.6 255.255.255.252
ip ospf 1 area 0

int e1/0
no shut
ip addr 172.16.1.9 255.255.255.252
ip ospf 1 area 0

int Loopback0
 ip addr 3.3.3.3 255.255.255.255
 ip ospf 1 area 0
!

router ospf 1
router-id 3.3.3.3
mpls ldp autoconfig


----------PE2----------
ena
conf t
hostname PE2

int e1/0
no shut
ip addr 172.16.1.10 255.255.255.252
ip ospf 1 area 0

int loop0
no shut
ip addr 4.4.4.4 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 4.4.4.4
mpls ldp autoconfig

# VPLS Basic Configuration
PE1
int e1/2
xconnect 4.4.4.4 100 encapsulation mpls

PE2
int e1/2
xconnect 1.1.1.1 100 encapsulation mpls