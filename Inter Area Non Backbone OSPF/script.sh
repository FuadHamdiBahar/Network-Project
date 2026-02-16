# R1
ena
conf t
hostname R1

int eth1/0
no shut
ip addr 10.1.2.1 255.255.255.0
ip ospf 1 area 0

int eth1/1
no shut
ip addr 10.1.4.1 255.255.255.0
ip ospf 1 area 1

int loop0
no shut
ip addr 192.168.254.1 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.1
mpls ldp autoconfig

# R2
ena
conf t
hostname R2

int eth1/0
no shut
ip addr 10.1.2.2 255.255.255.0
ip ospf 1 area 0

int eth1/1
no shut
ip addr 10.2.3.2 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip addr 192.168.254.2 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.2
mpls ldp autoconfig

# R3
ena
conf t
hostname R3

int eth1/0
no shut
ip addr 10.3.8.3 255.255.255.0
ip ospf 1 area 2

int eth1/1
no shut
ip addr 10.2.3.3 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip addr 192.168.254.3 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.3
mpls ldp autoconfig

# R8
ena
conf t
hostname R8

int eth1/0
no shut
ip addr 10.3.8.8 255.255.255.0
ip ospf 1 area 2

int eth1/1
no shut
ip addr 10.8.9.8 255.255.255.0
ip ospf 1 area 2

int eth1/3
no shut
ip addr 10.4.8.8 255.255.255.0
ip ospf 1 area 2

int loop0
no shut
ip addr 192.168.254.8 255.255.255.255
ip ospf 1 area 2

router ospf 1
router-id 192.168.254.8
mpls ldp autoconfig

# R9
ena
conf t
hostname R9

int eth1/1
no shut
ip addr 10.8.9.9 255.255.255.0
ip ospf 1 area 2

int eth1/3
no shut
ip addr 10.7.9.9 255.255.255.0
ip ospf 1 area 2

int loop0
no shut
ip addr 192.168.254.9 255.255.255.255
ip ospf 1 area 2

router ospf 1
router-id 192.168.254.9
mpls ldp autoconfig

# R4
ena
conf t
hostname R4

int eth1/0
no shut
ip addr 10.4.5.4 255.255.255.0
ip ospf 1 area 1

int eth1/1
no shut
ip addr 10.1.4.4 255.255.255.0
ip ospf 1 area 1

int eth1/2
no shut
ip addr 10.4.7.4 255.255.255.0
ip ospf 1 area 1

int eth1/3
no shut
ip addr 10.4.8.4 255.255.255.0
ip ospf 1 area 2

int loop0
no shut
ip addr 192.168.254.4 255.255.255.255
ip ospf 1 area 1

router ospf 1
router-id 192.168.254.4
mpls ldp autoconfig

# R7
ena
conf t
hostname R7

int eth1/0
no shut
ip addr 10.6.7.7 255.255.255.0
ip ospf 1 area 1

int eth1/2
no shut
ip addr 10.4.7.7 255.255.255.0
ip ospf 1 area 1

int eth1/3
no shut
ip addr 10.7.9.7 255.255.255.0
ip ospf 1 area 2

int loop0
no shut
ip addr 192.168.254.7 255.255.255.255
ip ospf 1 area 1

router ospf 1
router-id 192.168.254.7
mpls ldp autoconfig