ena
conf t
hostname R3

int eth1/0
no shu
ip add 10.3.9.3 255.255.255.0
ip ospf 1 area 20


int eth1/1
no shu
ip add 10.2.3.3 255.255.255.0
ip ospf 1 area 0

int loo0
no shu
ip add 192.168.1.3 255.255.255.0
ip ospf 1 area 0

router ospf 1
router-id 192.168.1.3