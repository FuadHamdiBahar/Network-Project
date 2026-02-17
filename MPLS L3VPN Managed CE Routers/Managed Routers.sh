# R11
vrf definition D1
 rd 65000:41
 address-family ipv4
 route-target import 65000:41
 route-target export 65000:11
 route-target export 65000:12
 route-target export 65000:21
 route-target export 65000:22
 route-target export 65000:31
 route-target export 65000:32

int eth 1/0
 no shut
 vrf forwarding D1
 ip address 10.11.12.11 255.255.255.0

router bgp 65000
 address-family ipv4 vrf D1
  neighbor 10.11.12.12 remote-as 65004

# R12
ena 
conf t
hostname R12

int eth 1/0
 no shutdown
 ip address 10.11.12.12 255.255.255.0

int eth1/1
 no shutdown
 ip address 192.168.7.12 255.255.255.0

router bgp 65004
 neighbor 10.11.12.11 remote-as 65000
 network 192.168.7.0 mask 255.255.255.0