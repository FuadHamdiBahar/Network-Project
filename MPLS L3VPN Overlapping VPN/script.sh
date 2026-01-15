# R1
ena
conf t
hostname R1

interface Loopback0
 no shutdown
 ip address 192.168.254.1 255.255.255.255
 ip ospf 1 area 0
exit

int eth 1/1
 no shutdown
 ip address 10.1.2.1 255.255.255.0
 ip ospf 1 area 0
exit

router ospf 1
 router-id 192.168.254.1
 mpls ldp autoconfig

# R2
ena
conf t
hostname R2

interface Loopback0
 no shutdown
 ip address 192.168.254.2 255.255.255.255
 ip ospf 1 area 0
exit

int eth 1/1
 no shutdown
 ip address 10.1.2.2 255.255.255.0
 ip ospf 1 area 0
exit

int eth 1/0
 no shutdown
 ip address 10.2.3.2 255.255.255.0
 ip ospf 1 area 0
exit

router ospf 1
 router-id 192.168.254.2
 mpls ldp autoconfig

# R3
ena
conf t
hostname R3

interface Loopback0
 no shutdown
 ip address 192.168.254.3 255.255.255.255
 ip ospf 1 area 0
exit

int eth 1/1
 no shutdown
 ip address 10.3.4.3 255.255.255.0
 ip ospf 1 area 0
exit

int eth 1/0
 no shutdown
 ip address 10.2.3.3 255.255.255.0
 ip ospf 1 area 0
exit

router ospf 1
 router-id 192.168.254.3
 mpls ldp autoconfig

# R4
ena
conf t
hostname R4

interface Loopback0
 no shutdown
 ip address 192.168.254.4 255.255.255.255
 ip ospf 1 area 0
exit

int eth 1/1
 no shutdown
 ip address 10.3.4.4 255.255.255.0
 ip ospf 1 area 0
exit

router ospf 1
 router-id 192.168.254.4
 mpls ldp autoconfig


# VRF Configuration on R1 and R4
# R1 VRF
vrf definition A1
 rd 65000:1
 address-family ipv4
  route-target import 65000:1
  route-target export 65000:1

vrf definition B1
 rd 65000:2
 address-family ipv4
  route-target import 65000:2
  route-target export 65000:2

vrf definition A3
 rd 65000:3
 address-family ipv4
  route-target import 65000:1
  route-target export 65000:1
  route-target import 65000:3
  route-target export 65000:3

int eth 1/0
 no shutdown
 vrf forwarding A1
 ip address 10.1.5.1 255.255.255.0
 desc Trunk to R5

int eth 1/2
 no shutdown
 vrf forwarding B1
 ip address 10.1.6.1 255.255.255.0
 desc Trunk to R6

int eth 1/3
 no shutdown
 vrf forwarding A3
 ip address 10.1.7.1 255.255.255.0
 desc Trunk to R7

router bgp 65000
 no bgp default ipv4-unicast
 neighbor 192.168.254.4 remote-as 65000
 neighbor 192.168.254.4 update-source Loopback0
 address-family vpnv4
  neighbor 192.168.254.4 activate
 address-family ipv4 vrf A1
  neighbor 10.1.5.5 remote-as 65001
  neighbor 10.1.5.5 as-override
 address-family ipv4 vrf B1
  neighbor 10.1.6.6 remote-as 65002
  neighbor 10.1.6.6 as-override
 address-family ipv4 vrf A3
  neighbor 10.1.7.7 remote-as 65001
  neighbor 10.1.7.7 as-override

# R4 VRF
vrf definition A2
 rd 65000:1
 address-family ipv4
  route-target import 65000:1
  route-target export 65000:1

vrf definition B2
 rd 65000:2
 address-family ipv4
  route-target import 65000:2
  route-target export 65000:2

vrf definition B3
 rd 65000:3
 address-family ipv4
  route-target import 65000:2
  route-target export 65000:2
  route-target import 65000:3
  route-target export 65000:3

int eth 1/0
 no shutdown
 vrf forwarding A2
 ip address 10.4.8.4 255.255.255.0
 desc Trunk to R8

int eth 1/2
 no shutdown
 vrf forwarding B2
 ip address 10.4.9.4 255.255.255.0
 desc Trunk to R9

int eth 1/3
 no shutdown
 vrf forwarding B3
 ip address 10.4.10.4 255.255.255.0
 desc Trunk to R10

router bgp 65000
 no bgp default ipv4-unicast
 neighbor 192.168.254.1 remote-as 65000
 neighbor 192.168.254.1 update-source Loopback0
 address-family vpnv4
  neighbor 192.168.254.1 activate
 address-family ipv4 vrf A2
  neighbor 10.4.8.8 remote-as 65001
  neighbor 10.4.8.8 as-override
 address-family ipv4 vrf B2
  neighbor 10.4.9.9 remote-as 65002
  neighbor 10.4.9.9 as-override
 address-family ipv4 vrf B3
  neighbor 10.4.10.10 remote-as 65002
  neighbor 10.4.10.10 as-override

#CE Router Configurations
# R5 (CE for VRF A1)
ena
conf t
hostname R5
int eth 1/0
 no shutdown
 ip address 10.1.5.5 255.255.255.0

int eth 1/1
 no shutdown
 ip address 192.168.1.5 255.255.255.0

router bgp 65001
 neighbor 10.1.5.1 remote-as 65000
 network 192.168.1.0 mask 255.255.255.0

# R6 (CE for VRF B1)
ena
conf t
hostname R6
int eth 1/2
 no shutdown
 ip address 10.1.6.6 255.255.255.0

int eth 1/0
 no shutdown
 ip address 192.168.1.6 255.255.255.0

router bgp 65002
 neighbor 10.1.6.1 remote-as 65000
 network 192.168.1.0 mask 255.255.255.0

# R7 (CE for VRF A3)
ena
conf t
hostname R7
int eth 1/3
 no shutdown
 ip address 10.1.7.7 255.255.255.0

int eth 1/0
 no shutdown
 ip address 192.168.3.7 255.255.255.0

router bgp 65001
 neighbor 10.1.7.1 remote-as 65000
 network 192.168.3.0 mask 255.255.255.0

# R8 (CE for VRF A2)
ena
conf t
hostname R8
int eth 1/0
 no shutdown
 ip address 10.4.8.8 255.255.255.0

int eth 1/1
 no shutdown
 ip address 192.168.2.8 255.255.255.0

router bgp 65001
 neighbor 10.4.8.4 remote-as 65000
 network 192.168.2.0 mask 255.255.255.0

# R9 (CE for VRF B2)
ena
conf t
hostname R9
int eth 1/2
 no shutdown
 ip address 10.4.9.9 255.255.255.0

int eth 1/0
 no shutdown
 ip address 192.168.2.9 255.255.255.0

router bgp 65002
 neighbor 10.4.9.4 remote-as 65000
 network 192.168.2.0 mask 255.255.255.0

# R10 (CE for VRF B3)
ena
conf t
hostname R10
int eth 1/3
 no shutdown
 ip address 10.4.10.10 255.255.255.0

int eth 1/0
 no shutdown
 ip address 192.168.4.10 255.255.255.0

router bgp 65002
 neighbor 10.4.10.4 remote-as 65000
 network 192.168.4.0 mask 255.255.255.0

# pc1
ip 192.168.1.10 24 192.168.1.5

# pc2
ip 192.168.1.10 24 192.168.1.6

# pc4
ip 192.168.2.10 24 192.168.2.8

# pc5
ip 192.168.2.10 24 192.168.2.9

# pc3
ip 192.168.3.10 24 192.168.3.7

# pc6
ip 192.168.4.11 24 192.168.4.10