# RR
ena
conf t
hostname RR

int e1/0
no shut
ip address 10.1.7.7 255.255.255.0
ip ospf 1 area 0

int e1/1
no shut
ip address 10.3.7.7 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip address 10.1.0.1 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 10.1.0.1

end
wr

# R1
ena
conf t
hostname R1

int e1/0
no shut
ip address 10.1.7.1 255.255.255.0
ip ospf 1 area 0

int e1/1
no shut
ip address 10.1.4.1 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip address 10.1.1.1 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 10.1.1.1

end 
wr

# R3
ena
conf t
hostname R3

int e1/0
no shut
ip address 10.2.3.3 255.255.255.0
ip ospf 1 area 0

int e1/1
no shut
ip address 10.3.7.3 255.255.255.0
ip ospf 1 area 0

int e1/2
no shut
ip address 10.3.6.3 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip address 10.1.3.1 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 10.1.3.1

end 
wr

# R2
ena
conf t
hostname R2

int e1/0
no shut
ip address 10.2.3.2 255.255.255.0
ip ospf 1 area 0

int e1/2
no shut
ip address 10.2.4.2 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip address 10.1.2.1 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 10.1.2.1

end 
wr

# R6
ena
conf t
hostname R6

int e1/0
no shut
ip address 10.5.6.6 255.255.255.0
ip ospf 1 area 0

int e1/2
no shut
ip address 10.3.6.6 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip address 10.1.6.1 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 10.1.6.1

end 
wr

# R4
ena
conf t
hostname R4

int e1/1
no shut
ip address 10.1.4.4 255.255.255.0
ip ospf 1 area 0

int e1/2
no shut
ip address 10.2.4.4 255.255.255.0
ip ospf 1 area 0

int e1/3
no shut
ip address 10.4.5.4 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip address 10.4.4.4 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 10.4.4.4

end 
wr

# R5
ena
conf t
hostname R5

int e1/0
no shut
ip address 10.5.6.5 255.255.255.0
ip ospf 1 area 0

int e1/3
no shut
ip address 10.4.5.5 255.255.255.0
ip ospf 1 area 0

int loop0
no shut
ip address 10.1.5.1 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 10.1.5.1

end 
wr

# iBGP
# R1
router bgp 100
bgp router-id 10.1.1.1
no synchronization
neighbor 10.1.0.1 remote-as 100
neighbor 10.1.0.1 update-source Loopback0

# R2
router bgp 100
bgp router-id 10.1.2.1
no synchronization
neighbor 10.1.0.1 remote-as 100
neighbor 10.1.0.1 update-source Loopback0

# R3
router bgp 100
bgp router-id 10.1.3.1
no synchronization
neighbor 10.1.0.1 remote-as 100
neighbor 10.1.0.1 update-source Loopback0

# R4
router bgp 100
bgp router-id 10.1.4.1
no synchronization
neighbor 10.1.0.1 remote-as 100
neighbor 10.1.0.1 update-source Loopback0

# R5
router bgp 100
bgp router-id 10.1.5.1
no synchronization
neighbor 10.1.0.1 remote-as 100
neighbor 10.1.0.1 update-source Loopback0

# R6
router bgp 100
bgp router-id 10.1.6.1
no synchronization
neighbor 10.1.0.1 remote-as 100
neighbor 10.1.0.1 update-source Loopback0

# RR
router bgp 100
bgp router-id 10.1.0.1
neighbor 10.1.1.1 remote-as 100
neighbor 10.1.1.1 update-source Loopback0
neighbor 10.1.1.1 route-reflector-client
neighbor 10.1.2.1 remote-as 100
neighbor 10.1.2.1 update-source Loopback0
neighbor 10.1.2.1 route-reflector-client
neighbor 10.1.3.1 remote-as 100
neighbor 10.1.3.1 update-source Loopback0
neighbor 10.1.3.1 route-reflector-client
neighbor 10.4.4.4 remote-as 100
neighbor 10.4.4.4 update-source Loopback0
neighbor 10.4.4.4 route-reflector-client

