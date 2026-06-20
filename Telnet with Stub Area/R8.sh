ena
conf t
hostname R8

int eth1/2
no shu
ip add 10.8.9.8 255.255.255.0
ip ospf 1 area 20


int eth1/1
no shu
ip add 10.6.8.8 255.255.255.0
ip ospf 1 area 0

int loo0
no shu
ip add 192.168.1.8 255.255.255.0
ip ospf 1 area 0

router ospf 1
router-id 192.168.1.8


ena 
conf t
router ospf 1
mpls ldp autoconfig