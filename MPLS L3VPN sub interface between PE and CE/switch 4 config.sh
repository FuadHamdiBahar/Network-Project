Switch#show running-config 
Building configuration...

Current configuration : 922 bytes
!
! Last configuration change at 14:22:03 UTC Sat Jan 10 2026
!
version 15.1
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
service compress-config
!
hostname Switch
!
boot-start-marker
boot-end-marker
!
!
!
no aaa new-model
no ipv6 cef
ipv6 multicast rpf use-bgp
!
ip cef
!         
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
!
!
!
vlan internal allocation policy ascending
!
! 
!
!
!
!
!
!
!
!
interface Ethernet0/0
 switchport trunk encapsulation dot1q
 switchport trunk allowed vlan 1-3
 switchport mode trunk
 duplex auto
!
interface Ethernet0/1
 switchport access vlan 3
 switchport mode access
 duplex auto
!
interface Ethernet0/2
 switchport access vlan 2
 switchport mode access
 duplex auto
!
interface Ethernet0/3
 duplex auto
!
!
no ip http server
!
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

Switch#

vlan 2
name Customer_B
vlan 3
name Customer_A