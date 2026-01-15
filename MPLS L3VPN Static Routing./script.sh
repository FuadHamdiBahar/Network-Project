# R1
ena
conf t
hostname R1
int e1/0
no shut
desc Link to R2
ip ospf network point-to-point
ip addr 10.1.2.1 255.255.255.0

int loop0
no shut
ip addr 192.168.254.1 255.255.255.255

router ospf 1
router-id 192.168.254.1
network 10.1.2.1 0.0.0.0 area 0
network 192.168.254.1 0.0.0.0 area 0
end
wr

# R2
ena
conf t
hostname R2
int e1/0
no shut
desc Link to R1
ip ospf network point-to-point
ip addr 10.1.2.2 255.255.255.0

int e1/1
no shut
desc Link to R3
ip ospf network point-to-point
ip addr 10.2.3.2 255.255.255.0

router ospf 1
router-id 192.168.254.2
network 10.1.2.2 0.0.0.0 area 0
network 10.2.3.2 0.0.0.0 area 0
end
wr

# R3
ena
conf t
hostname R3

int e1/1
no shut
desc Link to R2
ip ospf network point-to-point
ip addr 10.2.3.3 255.255.255.0

int e1/0
no shut
desc Link to R4
ip ospf network point-to-point
ip addr 10.3.4.3 255.255.255.0

router ospf 1
router-id 192.168.254.3
network 10.2.3.3 0.0.0.0 area 0
network 10.3.4.3 0.0.0.0 area 0
end
wr

# R4
ena
conf t
hostname R4
int e1/0
no shut
desc Link to R3
ip ospf network point-to-point
ip addr 10.3.4.4 255.255.255.0

int loop0
no shut
ip addr 192.168.254.4 255.255.255.255

router ospf 1
router-id 192.168.254.4
network 10.3.4.4 0.0.0.0 area 0
network 192.168.254.4 0.0.0.0 area 0
end
wr

#BGP PEER
#R1
router bgp 65000
no bgp default ipv4-unicast
neighbor 192.168.254.4 remote-as 65000 
neighbor 192.168.254.4 update-source loopback0
address-family vpnv4
    neighbor 192.168.254.4 activate

#R4
router bgp 65000
no bgp default ipv4-unicast
neighbor 192.168.254.1 remote-as 65000 
neighbor 192.168.254.1 update-source loopback0
address-family vpnv4
    neighbor 192.168.254.1 activate


#MPLS
#R1/R2/R3/R4
router ospf 1
mpls ldp autoconfig

#VRF Traditional Method
#R1
ip vrf A1
    rd 65000:11
    route-target export 65000:12
    route-target import 65000:11

ip vrf B1
    rd 65000:21
    route-target export 65000:22
    route-target import 65000:21

#Memasang vrf di interface yang ke user
#R1
interface eth1/2
ip vrf forwarding A1
ip address 10.1.5.1 255.255.255.0
no shut
description Link to User A site 1

interface eth1/3
ip vrf forwarding B1
ip address 10.1.6.1 255.255.255.0
no shut
description Link to User B site 1

#R4
ip vrf A2
    rd 65000:12
    route-target export 65000:11
    route-target import 65000:12

ip vrf B2
    rd 65000:22
    route-target export 65000:21
    route-target import 65000:22

#Memasang vrf di interface yang ke user
#R4
interface eth1/2
ip vrf forwarding A2
ip address 10.4.7.4 255.255.255.0
no shut
description Link to User A site 2

interface eth1/3
ip vrf forwarding B2
ip address 10.4.8.4 255.255.255.0
no shut
description Link to User B site 2

#Traditional connection betwenn 2 Router
#R5
ena
conf t
hostname R5
int eth1/2
no shut
desc Link to R1
ip addr 10.1.5.5 255.255.255.0

int eth1/7
no shut
desc Link to User A Site 1
ip addr 192.168.1.5 255.255.255.0

#R6
ena
conf t
hostname R6
int eth1/3
no shut
desc Link to R1
ip addr 10.1.6.6 255.255.255.0

int eth1/7
no shut
desc Link to User B Site 1
ip addr 192.168.1.6 255.255.255.0

#R7
ena
conf t
hostname R7
int eth1/2
no shut
desc Link to R4
ip addr 10.4.7.7 255.255.255.0

int eth1/7
no shut
desc Link to User A Site 2
ip addr 192.168.2.7 255.255.255.0

#R8
ena
conf t
hostname R8
int eth1/3
no shut
desc Link to R4
ip addr 10.4.8.8 255.255.255.0

int eth1/7
no shut
desc Link to User B Site 2
ip addr 192.168.2.8 255.255.255.0

#Sekarang kita ingin memberi tahu cara R1 untuk bisa ke R5/R6 dam sebaliknya dengan menambah static route
#R1
ip route vrf A1 192.168.1.0 255.255.255.0 10.1.5.5
ip route vrf B1 192.168.1.0 255.255.255.0 10.1.6.6

#R4
ip route vrf A2 192.168.2.0 255.255.255.0 10.4.7.7
ip route vrf B2 192.168.2.0 255.255.255.0 10.4.8.8

#R5
ip route 192.168.2.0 255.255.255.0 10.1.5.1

#R6
ip route 192.168.2.0 255.255.255.0 10.1.6.1

#R7
ip route 192.168.1.0 255.255.255.0 10.4.7.4

#R8
ip route 192.168.1.0 255.255.255.0 10.4.8.4

#Sekarang kita ingin redistribute static route ke bgp agar bisa di share ke vrf lain
#R1
router bgp 65000
address-family ipv4 vrf A1
    redistribute static
address-family ipv4 vrf B1
    redistribute static

#R4
router bgp 65000
address-family ipv4 vrf A2
    redistribute static
address-family ipv4 vrf B2
    redistribute static


router# show bgp vpnv4 unicast all summary
router# show bgp vpnv4 unicast all
router# show bgp vpnv4 unicast vrf A1
router# show bgp vpnv4 unicast rd RD

router# show ip route vrf VRF_NAME
router# show ip vrf [interface][detail]

router# show mpls ldp [neighbors][binding]
router# show mpls forwarding-table
router# show ip cef NET MASK