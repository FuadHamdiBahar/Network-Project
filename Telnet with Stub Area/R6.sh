ena
conf t
hostname R6

int eth1/0
no shu
ip add 10.5.6.6 255.255.255.0
ip ospf 1 area 10


int eth1/1
no shu
ip add 10.6.8.6 255.255.255.0
ip ospf 1 area 0

int loo0
no shu
ip add 192.168.1.6 255.255.255.0
ip ospf 1 area 0

router ospf 1
router-id 192.168.1.6