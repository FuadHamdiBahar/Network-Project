DHCP-Server#show running-config 
Building configuration...

Current configuration : 1008 bytes
!
! Last configuration change at 12:49:06 UTC Tue Feb 17 2026
!
version 15.2
service timestamps debug datetime msec
service timestamps log datetime msec
!
hostname DHCP-Server
!
boot-start-marker
boot-end-marker
!
!
!
no aaa new-model
!
!
!
ip dhcp excluded-address 192.168.1.1 192.168.1.10
!
ip dhcp pool MY_NETWORK
 network 192.168.1.0 255.255.255.0
 default-router 192.168.1.1 
 dns-server 8.8.8.8 
!
!
!
ip cef
no ipv6 cef
!
!
multilink bundle-name authenticated
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
!
interface FastEthernet0/0
 no ip address
 shutdown
 duplex full
!
interface Ethernet1/0
 ip address 192.168.1.2 255.255.255.0
 duplex full
!
interface Ethernet1/1
 no ip address
 shutdown
 duplex full
!
interface Ethernet1/2
 no ip address
 shutdown
 duplex full
!
interface Ethernet1/3
 no ip address
 shutdown
 duplex full
!
ip forward-protocol nd
!
!
no ip http server
no ip http secure-server
!
!
!
!
control-plane
!
!
line con 0
 stopbits 1
line aux 0
 stopbits 1
line vty 0 4
 login
!
!
end
