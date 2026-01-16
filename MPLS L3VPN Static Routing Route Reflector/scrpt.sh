# R1
ena
conf t
hostname R1
interface Loopback0
 no shut
 ip address 192.168.254.1 255.255.255.255
 ip ospf 1 area 0

interface ethernet1/0
 no shut
 ip address 10.1.9.1 255.255.255.0
 ip ospf 1 area 0
 ip ospf network point-to-point

router ospf 1
 router-id 192.168.254.1
 mpls ldp autoconfig

# R2
ena
conf t
hostname R2
interface Loopback0
 no shut
 ip address 192.168.254.2 255.255.255.255
 ip ospf 1 area 0

interface ethernet1/1
 no shut
 ip address 10.2.9.2 255.255.255.0
 ip ospf 1 area 0
 ip ospf network point-to-point

router ospf 1
 router-id 192.168.254.2
 mpls ldp autoconfig

# R3
ena
conf t
hostname R3
interface Loopback0
 no shut
 ip address 192.168.254.3 255.255.255.255
 ip ospf 1 area 0

interface ethernet1/2
 no shut
 ip address 10.3.9.3 255.255.255.0
 ip ospf 1 area 0
 ip ospf network point-to-point

interface ethernet1/0
 no shut
 ip address 10.3.7.3 255.255.255.0

router ospf 1
 router-id 192.168.254.3
 mpls ldp autoconfig

# R4
ena
conf t
hostname R4
interface Loopback0
 no shut
 ip address 192.168.254.4 255.255.255.255
 ip ospf 1 area 0

interface ethernet1/3
 no shut
 ip address 10.4.9.4 255.255.255.0
 ip ospf 1 area 0
 ip ospf network point-to-point

router ospf 1
 router-id 192.168.254.4
 mpls ldp autoconfig

# R9
ena
conf t
hostname R9
interface Loopback0
 no shut
 ip address 192.168.254.9 255.255.255.255
 ip ospf 1 area 0

interface ethernet1/0
 no shut
 ip address 10.1.9.9 255.255.255.0
 ip ospf 1 area 0
 ip ospf network point-to-point

interface ethernet1/1
 no shut
 ip address 10.2.9.9 255.255.255.0
 ip ospf 1 area 0
 ip ospf network point-to-point

interface ethernet1/2
 no shut
 ip address 10.3.9.9 255.255.255.0
 ip ospf 1 area 0
 ip ospf network point-to-point

interface ethernet1/3
 no shut
 ip address 10.4.9.9 255.255.255.0
 ip ospf 1 area 0
 ip ospf network point-to-point

interface ethernet2/0
 no shut
 ip address 10.9.10.9 255.255.255.0
 ip ospf 1 area 0
 ip ospf network point-to-point

router ospf 1
 router-id 192.168.254.9
 mpls ldp autoconfig

# R10
ena
conf t
hostname R10
interface Loopback0
 no shut
 ip address 192.168.254.10 255.255.255.255
 ip ospf 1 area 0

interface ethernet1/0
 no shut
 ip address 10.9.10.10 255.255.255.0
 ip ospf 1 area 0
 ip ospf network point-to-point
 
router ospf 1
 router-id 192.168.254.10
 mpls ldp autoconfig


# BGP Configuration on R1, R2, R3, R4, R9, R10
# R1
mpls label range 100 199
router bgp 65000
 no bgp default ipv4-unicast
 neighbor 192.168.254.9 remote-as 65000
 neighbor 192.168.254.9 update-source Loopback0
 address-family vpnv4
  neighbor 192.168.254.9 activate

# R2
mpls label range 200 299
router bgp 65000
 no bgp default ipv4-unicast
 neighbor 192.168.254.9 remote-as 65000
 neighbor 192.168.254.9 update-source Loopback0
 address-family vpnv4
  neighbor 192.168.254.9 activate

# R3
mpls label range 300 399
router bgp 65000
 no bgp default ipv4-unicast
 neighbor 192.168.254.9 remote-as 65000
 neighbor 192.168.254.9 update-source Loopback0
 address-family vpnv4
  neighbor 192.168.254.9 activate

# R4
mpls label range 400 499
router bgp 65000
 no bgp default ipv4-unicast
 neighbor 192.168.254.9 remote-as 65000
 neighbor 192.168.254.9 update-source Loopback0
 address-family vpnv4
  neighbor 192.168.254.9 activate

# R10
mpls label range 1000 1099
router bgp 65000
 no bgp default ipv4-unicast
 neighbor 192.168.254.9 remote-as 65000
 neighbor 192.168.254.9 update-source Loopback0
 address-family vpnv4
  neighbor 192.168.254.9 activate

# R9
mpls label range 900 999
router bgp 65000
 no bgp default ipv4-unicast
 neighbor RRC peer-group
 neighbor RRC remote-as 65000
 neighbor RRC update-source Loopback0
 neighbor 192.168.254.1 peer-group RRC
 neighbor 192.168.254.2 peer-group RRC
 neighbor 192.168.254.3 peer-group RRC
 neighbor 192.168.254.4 peer-group RRC
 neighbor 192.168.254.10 peer-group RRC
 address-family vpnv4
  neighbor 192.168.254.1 activate
  neighbor 192.168.254.2 activate
  neighbor 192.168.254.3 activate
  neighbor 192.168.254.4 activate
  neighbor 192.168.254.10 activate
  neighbor RRC route-reflector-client


# VRF Configuration on R1, R2, R3, R4, R10
# R1
vrf definition A1
 rd 65000:1
 address-family ipv4
 route-target export 65000:1
 route-target import 65000:1


interface ethernet1/1
 no shut
 vrf forwarding A1
 ip address 10.1.5.1 255.255.255.0

# R2
vrf definition B1
 rd 65000:2
 address-family ipv4
 route-target export 65000:2
 route-target import 65000:2

interface ethernet1/0
 no shut
 vrf forwarding B1
 ip address 10.2.6.2 255.255.255.0

# R3
vrf definition A2
 rd 65000:1
 address-family ipv4
 route-target export 65000:1
 route-target import 65000:1


interface ethernet1/0
 no shut
 vrf forwarding A2
 ip address 10.3.7.3 255.255.255.0

# R4
vrf definition B2
 rd 65000:2
 address-family ipv4
 route-target export 65000:2
 route-target import 65000:2

interface ethernet1/0
 no shut
 vrf forwarding B2
 ip address 10.4.8.4 255.255.255.0

# R10
vrf definition A3
 rd 65000:1
 address-family ipv4
 route-target export 65000:1
 route-target import 65000:1

vrf definition B3
 rd 65000:2
 address-family ipv4
 route-target export 65000:2
 route-target import 65000:2

interface ethernet1/1
 no shut
 vrf forwarding A3
 ip address 10.10.11.10 255.255.255.0

interface ethernet1/2
 no shut
 vrf forwarding B3
 ip address 10.10.12.10 255.255.255.0

# Static Route PE
# R1
ip route vrf A1 192.168.1.0 255.255.255.0 10.1.5.5

# R2
ip route vrf B1 192.168.3.0 255.255.255.0 10.2.6.6

# R3
ip route vrf A2 192.168.2.0 255.255.255.0 10.3.7.7

# R4
ip route vrf B2 192.168.4.0 255.255.255.0 10.4.8.8

# R10
ip route vrf A3 192.168.5.0 255.255.255.0 10.10.11.11
ip route vrf B3 192.168.6.0 255.255.255.0 10.10.12.12

# Configuring CE
# R5
ena
conf t
hostname R5
int eth1/1
 no shut
 ip addr 10.1.5.5 255.255.255.0

int eth1/0
 no shut
 desc Trunk to Customer A site 1
 ip addr 192.168.1.5 255.255.255.0

# R6
ena
conf t
hostname R6
int eth1/0
 no shut
 ip addr 10.2.6.6 255.255.255.0

int eth1/1
 no shut
 desc Trunk to Customer B site 1
 ip addr 192.168.3.6 255.255.255.0

# R7
ena
conf t
hostname R7
int eth1/0
 no shut
 ip addr 10.3.7.7 255.255.255.0

int eth1/1
 no shut
 desc Trunk to Customer A site 2
 ip addr 192.168.2.7 255.255.255.0

# R8
ena
conf t
hostname R8
int eth1/0
 no shut
 ip addr 10.4.8.8 255.255.255.0

int eth1/1
 no shut
 desc Trunk to Customer B site 2
 ip addr 192.168.4.8 255.255.255.0

# R11
ena
conf t
hostname R11
int eth1/1
 no shut
 ip addr 10.10.11.11 255.255.255.0

int eth1/0
 no shut
 desc Trunk to Customer A site 3
 ip addr 192.168.5.11 255.255.255.0

# R12
ena
conf t
hostname R12
int eth1/2
 no shut
 ip addr 10.10.12.12 255.255.255.0

int eth1/0
 no shut
 desc Trunk to Customer B site 3
 ip addr 192.168.6.12 255.255.255.0


# Adding static route to BGP
# R1, R2, R3, R4 dan R10
router bgp 65000
 address-family ipv4 vrf A3
  redistribute static
 address-family ipv4 vrf B3
  redistribute static

# Static Route CE
# R5,6,7,8,11,12
ip route 0.0.0.0 0.0.0.0 10.10.12.10

# VPC
ip 192.168.1.10 24 192.168.1.5

ip 192.168.3.10 24 192.168.3.6

ip 192.168.2.10 24 192.168.2.7

ip 192.168.4.10 24 192.168.4.8

ip 192.168.5.10 24 192.168.5.11

ip 192.168.6.10 24 192.168.6.12