ena
conf t
hostname R5

int eth1/2
no shu
ip add 10.4.5.5 255.255.255.0
ip ospf 1 area 10

int eth1/0
no shu
ip add 10.5.6.5 255.255.255.0
ip ospf 1 area 10

int loo0
no shu
ip add 192.168.1.5 255.255.255.0
ip ospf 1 area 10

router ospf 1
router-id 192.168.1.5