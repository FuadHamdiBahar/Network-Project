CSR1#show running-config 
Building configuration...

Current configuration : 3926 bytes
!
! Last configuration change at 12:35:04 UTC Tue Feb 17 2026
!
version 16.9
service timestamps debug datetime msec
service timestamps log datetime msec
platform qfp utilization monitor load 80
platform punt-keepalive disable-kernel-core
platform console serial
!
hostname CSR1
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
crypto pki trustpoint TP-self-signed-394598331
 enrollment selfsigned
 subject-name cn=IOS-Self-Signed-Certificate-394598331
 revocation-check none
 rsakeypair TP-self-signed-394598331
!
!
crypto pki certificate chain TP-self-signed-394598331
 certificate self-signed 01
  3082032E 30820216 A0030201 02020101 300D0609 2A864886 F70D0101 05050030 
  30312E30 2C060355 04031325 494F532D 53656C66 2D536967 6E65642D 43657274 
  69666963 6174652D 33393435 39383333 31301E17 0D323630 32313731 30313534 
  335A170D 33303031 30313030 30303030 5A303031 2E302C06 03550403 1325494F 
  532D5365 6C662D53 69676E65 642D4365 72746966 69636174 652D3339 34353938 
  33333130 82012230 0D06092A 864886F7 0D010101 05000382 010F0030 82010A02 
  82010100 9D212CE5 A1E00919 3F89434B 5A4DF56C 6DED239A DA07C667 0AFFF66E 
  7A61E160 F80A4AEB 090FDD49 B6B7C7A0 89097AB6 1AE6FBEF F37AE710 D7276E59 
  48F54420 E86B1017 CBB32AB8 55E4F190 88DEED1A 2EA43AF8 AF9E1C6A 1E0EBC5C 
  95CB9C69 73E1DBED 0E89EF89 D6B1BC09 5E5AF3B5 282B6B8A 049275E1 C7FD4C61 
  8972A336 ED33BAD4 10397505 075C9B87 E032521B B542623B 89AF092B E5F3953A 
  AC2195B4 F0B08D23 45973E1A 8BECBC1B 8179F889 84394E3C 0CE0B050 21BC1A0D 
  2D8B63B8 C4F5453C 7C0171EC 3A714105 494E6F4F 3141C3A7 E165EC3D 2729CF87 
  ED6C413C 06D882CD ACE1ACEA 488BBE2A 865224EC 76DFF633 D900B003 FD35FA50 
  15749723 02030100 01A35330 51300F06 03551D13 0101FF04 05300301 01FF301F 
  0603551D 23041830 1680146D 674EFC33 9AB6A42E A639F052 ED1D47C4 6C3A0A30 
  1D060355 1D0E0416 04146D67 4EFC339A B6A42EA6 39F052ED 1D47C46C 3A0A300D 
  06092A86 4886F70D 01010505 00038201 0100880F 5CBD557A 911FD6E2 BD6B0BC8 
  C1F0848E 81B8B1C7 4562D0CB 36B704BA E0EE1C9F 3EA2CC4B E37B18B5 E0671AC0 
  3E54D315 BC9A34A1 6CE6FD96 DFE9BC32 CB244AAE 9A70AD90 99B2F338 D5D59697 
  A44D9D18 9250C5A3 CFB8C69C 80B487E1 22CB629D 3B006536 97B02BA8 3BBA6B2C 
  775F3802 D3525A8B AAB8B475 9DFEB4C9 A265BB96 221EDBAA 7836E7DB 902E9988 
  D7870C16 8FA553DE 6323BBA8 8EC328DA 21619C14 8C932F5B 0D5DFAD6 C3A9F3DB 
  C00E8201 2C3BA14F BD702F86 235B3670 DD3F5648 5B311643 9EB31A8B 611113FC 
  5A2E5869 27D176BF EA57C5C7 66D913B8 D8BFABD3 2925938B A7CBBBEA 8A139857 
  855276ED 70D86358 AECBDA2D 1041E7D5 6FB5
  	quit
!
!
!
!
!
!
!         
!
license udi pid CSR1000V sn 9DODUYH3LZG
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
l2 vfi 2807 manual 
 vpn id 2807
 bridge-domain 2807
 mtu 1998
 neighbor 192.168.254.3 encapsulation mpls
 neighbor 192.168.254.4 encapsulation mpls
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
 ip address 192.168.254.1 255.255.255.255
 ip ospf 1 area 0
!
interface GigabitEthernet1
 no ip address
 negotiation auto
 service instance 2807 ethernet
  encapsulation dot1q 2807
  rewrite ingress tag pop 1 symmetric
  bridge-domain 2807
 !
!
interface GigabitEthernet2
 ip address 10.1.2.1 255.255.255.0
 ip ospf 1 area 0
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
 no ip address
 shutdown
 negotiation auto
 no mop enabled
 no mop sysid
!
router ospf 1
 router-id 192.168.254.1
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
