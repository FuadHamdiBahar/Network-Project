R8#show running-config 
Building configuration...

Current configuration : 3880 bytes
!
! Last configuration change at 18:16:14 UTC Mon Feb 16 2026
!
version 16.9
service timestamps debug datetime msec
service timestamps log datetime msec
platform qfp utilization monitor load 80
platform punt-keepalive disable-kernel-core
platform console serial
!
hostname R8
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
!         
!
!
!
!
!
!
login on-success log
!
!
!
!
!
!
!
subscriber templating
! 
! 
! 
! 
!
multilink bundle-name authenticated
!
!         
!
!
!
crypto pki trustpoint TP-self-signed-1478615262
 enrollment selfsigned
 subject-name cn=IOS-Self-Signed-Certificate-1478615262
 revocation-check none
 rsakeypair TP-self-signed-1478615262
!
!
crypto pki certificate chain TP-self-signed-1478615262
 certificate self-signed 01
  30820330 30820218 A0030201 02020101 300D0609 2A864886 F70D0101 05050030 
  31312F30 2D060355 04031326 494F532D 53656C66 2D536967 6E65642D 43657274 
  69666963 6174652D 31343738 36313532 3632301E 170D3236 30323136 31373035 
  34365A17 0D333030 31303130 30303030 305A3031 312F302D 06035504 03132649 
  4F532D53 656C662D 5369676E 65642D43 65727469 66696361 74652D31 34373836 
  31353236 32308201 22300D06 092A8648 86F70D01 01010500 0382010F 00308201 
  0A028201 0100B31C 9C043737 95DD1DF9 0C877E26 AFEBA2F7 283F6534 A9B293B9 
  9AD39F04 E0F1409B ABB14A58 44F94B21 422C5CA4 86077FD8 1DC25F02 0E128731 
  EA942C94 DDAF37AF 625A4E94 CD92D07D E6728B8D B1F51519 358B3E54 3A9C1B17 
  27598C16 096A8D3C A3BEAE46 6CBB3468 829FB833 0773AF23 A023DD09 40EC2DBE 
  C2AF8355 97CAA82A 8BA9F930 5F901DBF F6ED2E82 84A42AC4 639A15FD 8F2514F2 
  3B905C4E 5D3E8A7C CF49F22A 0E78DD8F 4EFAE4D5 01127F61 4F746200 12A3313F 
  972AECD6 7B8A3A17 335DB3D3 B7E08488 6035056A B6C5DFC1 B78F48B2 609D0DA0 
  240BF6D2 F70A6F89 4215A040 DA3E3B46 A04C4466 1CA859CF 23952E7C 3B336595 
  49265033 28ED0203 010001A3 53305130 0F060355 1D130101 FF040530 030101FF 
  301F0603 551D2304 18301680 14113750 2EF95DF4 A48B6803 06A7573C 84CCA4C9 
  2A301D06 03551D0E 04160414 1137502E F95DF4A4 8B680306 A7573C84 CCA4C92A 
  300D0609 2A864886 F70D0101 05050003 82010100 2DE943AD B25ACE4E 40634EC5 
  F6A56E70 A00C1B3D EFFB9E9E 0C0ECF6F D4B698DB A8787B77 8E440DEA C246A65C 
  7A3526CA FB03DACC C595DB45 8A487621 5BFBD831 4085E572 9CD88BB0 93E16034 
  3E50D86A 1108A9B2 2B11D3B7 23D1B60C 9E18B842 A92CF323 2846374C B7052C92 
  5F7338B8 35F0ABA7 D5B19783 AFFD2EA2 5AD63A42 3C58D3CF B552D44B 90A154B6 
  823616C8 162FE8A8 7CFB4523 F86B307F 89435C19 EF089140 95A44245 36E130D7 
  49C0354E 6924A9C6 7DD3E4B6 C92F1615 208FCEF6 0B44982B 1854638F 0536BA83 
  6B383444 A768287A 04A71B83 91463513 F93CA3F3 3967F82F 923166B8 52D72F34 
  3EA11BD9 4A85451A 9565F8EC B329E7B7 F441664D
  	quit
!
!
!
!
!
!
!         
!
license udi pid CSR1000V sn 9CTSCFZ2S8C
no license smart enable
diagnostic bootup level minimal
!
spanning-tree extend system-id
!
!
!
!
redundancy
!
!
!
!
!
!
l2 vfi 500 manual 
 vpn id 500
 bridge-domain 500
 mtu 1998
 neighbor 192.168.254.7 encapsulation mpls
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
interface Loopback0
 ip address 192.168.254.8 255.255.255.255
 ip ospf 1 area 0
!
interface GigabitEthernet1
 ip address 10.7.8.8 255.255.255.0
 ip ospf 1 area 0
 negotiation auto
 no mop enabled
 no mop sysid
!
interface GigabitEthernet2
 no ip address
 shutdown
 negotiation auto
 no mop enabled
 no mop sysid
!
interface GigabitEthernet3
 no ip address
 shutdown
 negotiation auto
 no mop enabled
 no mop sysid
!
interface GigabitEthernet4
 mtu 1998
 no ip address
 negotiation auto
 no mop enabled
 no mop sysid
 service instance 500 ethernet
  encapsulation dot1q 500
  rewrite ingress tag pop 1 symmetric
  bridge-domain 500
 !
!
router ospf 1
 router-id 192.168.254.8
 mpls ldp autoconfig
!
ip forward-protocol nd
ip http server
ip http authentication local
ip http secure-server
!
!
!
!
!
!
control-plane
!
!
!
!
!
!
line con 0
 stopbits 1
line vty 0 4
 login
!
!
!
!
!
!
end

R8#    