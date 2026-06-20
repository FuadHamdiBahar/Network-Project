ena
conf t
hostname R1

int eth1/0
no shu
ip add 10.1.2.1 255.255.255.0
ip ospf 1 area 10

int eth1/1
no shu
ip add 10.1.4.1 255.255.255.0
ip ospf 1 area 10

int loo0
no shu
ip add 192.168.1.1 255.255.255.0
ip ospf 1 area 10

router ospf 1
router-id 192.168.1.1