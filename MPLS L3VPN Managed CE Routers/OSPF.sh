# R1
ena
conf t
hostname R1

int eth 1/1
no shut
ip ospf network point-to-point
ip addr 10.1.2.1 255.255.255.0
ip ospf 1 area 0

int loop0
ip address 192.168.254.1 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.1
mpls ldp autoconfig

# R2
ena
conf t
hostname R2

int eth 1/1
no shut
ip ospf network point-to-point
ip addr 10.1.2.2 255.255.255.0
ip ospf 1 area 0

int eth 1/0
no shut
ip ospf network point-to-point
ip addr 10.2.3.2 255.255.255.0
ip ospf 1 area 0

int eth 1/3
no shut
ip ospf network point-to-point
ip addr 10.2.11.2 255.255.255.0
ip ospf 1 area 0

int loop0
ip address 192.168.254.2 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.2
mpls ldp autoconfig

# R3
ena
conf t
hostname R3

int eth 1/1
no shut
ip ospf network point-to-point
ip addr 10.3.4.3 255.255.255.0
ip ospf 1 area 0

int eth 1/0
no shut
ip ospf network point-to-point
ip addr 10.2.3.3 255.255.255.0
ip ospf 1 area 0

int eth 1/2
no shut
ip ospf network point-to-point
ip addr 10.3.11.3 255.255.255.0
ip ospf 1 area 0

int loop0
ip address 192.168.254.3 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.3
mpls ldp autoconfig

# R4
ena
conf t
hostname R4

int eth 1/1
no shut
ip ospf network point-to-point
ip addr 10.3.4.4 255.255.255.0
ip ospf 1 area 0

int loop0
ip address 192.168.254.4 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.4
mpls ldp autoconfig

# R11
ena
conf t
hostname R11

int eth 1/3
no shut
ip ospf network point-to-point
ip addr 10.2.11.11 255.255.255.0
ip ospf 1 area 0

int eth 1/2
no shut
ip ospf network point-to-point
ip addr 10.3.11.11 255.255.255.0
ip ospf 1 area 0

int loop0
ip address 192.168.254.11 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.11
mpls ldp autoconfig