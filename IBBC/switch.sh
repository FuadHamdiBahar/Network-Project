S5#show running-config 
Building configuration...

Current configuration : 905 bytes
!
! Last configuration change at 12:43:05 UTC Tue Feb 17 2026
!
version 15.1
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
service compress-config
!
hostname S5
!
boot-start-marker
boot-end-marker
!
!
!
no aaa new-model
!
ip cef
!
!
no ipv6 cef
ipv6 multicast rpf use-bgp
spanning-tree mode pvst
spanning-tree extend system-id
!
!
!
!
!
!
vlan internal allocation policy ascending
!
vlan 2807 
!
!
!
!
!
interface Ethernet0/0
 switchport trunk encapsulation dot1q
 switchport mode trunk
!
interface Ethernet0/1
 switchport access vlan 2807
 switchport mode access
!
interface Ethernet0/2
 switchport access vlan 2807
 switchport mode access
 duplex auto
!
interface Ethernet0/3
 switchport access vlan 2807
 switchport mode access
!
!
!
no ip http server
!
!
!
!
control-plane
!
!
line con 0
 logging synchronous
line aux 0
line vty 0 4
!
end
