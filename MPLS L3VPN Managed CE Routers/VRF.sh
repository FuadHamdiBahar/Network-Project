# R1
vrf definition A1
 rd 65000:11
 address-family ipv4
 route-target export 65000:12
 route-target import 65000:11

vrf definition B1
 rd 65000:21
 address-family ipv4
 route-target export 65000:22
 route-target import 65000:21

vrf definition C1
 rd 65000:31
 address-family ipv4
 route-target export 65000:32
 route-target import 65000:31

int eth 1/0
 no shut
 vrf forwarding A1
 ip address 10.1.5.1 255.255.255.0

int eth 1/2
 no shut
 vrf forwarding B1
 ip address 10.1.6.1 255.255.255.0

int eth 1/3
 no shut
 vrf forwarding C1
 ip address 10.1.7.1 255.255.255.0

# R4
vrf definition A2
 rd 65000:12
 address-family ipv4
 route-target export 65000:11
 route-target import 65000:12

vrf definition B2
 rd 65000:22
 address-family ipv4
 route-target export 65000:21
 route-target import 65000:22

vrf definition C2
 rd 65000:32
 address-family ipv4
 route-target export 65000:31
 route-target import 65000:32

int eth 1/0
 no shut
 vrf forwarding A2
 ip address 10.4.8.4 255.255.255.0

int eth 1/2
 no shut
 vrf forwarding B2
 ip address 10.4.9.4 255.255.255.0

int eth 1/3
 no shut
 vrf forwarding C2
 ip address 10.4.10.4 255.255.255.0