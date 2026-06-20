ena
conf t
hostname R9

int eth1/0
no shu
ip add 10.3.9.9 255.255.255.0
ip ospf 1 area 20

int eth1/2
no shu
ip add 10.8.9.9 255.255.255.0
ip ospf 1 area 20

int loo0
no shu
ip add 192.168.1.9 255.255.255.0
ip ospf 1 area 20

router ospf 1
router-id 192.168.1.9