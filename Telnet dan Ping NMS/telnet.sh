ena
conf t
hostname R2

int eth1/0
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

ena
conf t
hostname R3

int eth1/0
no shut
ip addr 10.2.3.3 255.255.255.0
ip ospf 1 area 0

int eth1/1
no shut
ip addr 10.3.4.3 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip addr 192.168.254.3 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.3
mpls ldp autoconfig

ena
conf t
hostname R4

int eth1/0
no shut
ip addr 10.4.5.4 255.255.255.0
ip ospf 1 area 0

int eth1/1
no shut
ip addr 10.3.4.4 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip addr 192.168.254.4 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.4
mpls ldp autoconfig

ena
conf t
hostname R5

int eth1/0
no shut
ip addr 10.4.5.5 255.255.255.0
ip ospf 1 area 0

int eth1/1
no shut
ip addr 10.5.6.5 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip addr 192.168.254.5 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.5
mpls ldp autoconfig

ena
conf t
hostname R6

int eth1/1
no shut
ip addr 10.5.6.6 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip addr 192.168.254.6 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 192.168.254.6
mpls ldp autoconfig

# kuncinya
R6# configure terminal
R6(config)# line vty 0 4
R6(config-line)# password cisco
R6(config-line)# login
R6(config-line)# transport input telnet ssh
R6(config-line)# exit
R6(config)# enable password cisco