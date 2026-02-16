# R7

interface GigabitEthernet1
 ip address 10.7.8.7 255.255.255.0
 ip ospf 1 area 0
 negotiation auto
 no mop enabled
 no mop sysid
end

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
end
l2 vfi 500 manual 
 vpn id 500
 bridge-domain 500
 mtu 1998
 neighbor 192.168.254.8 encapsulation mpls

interface Loopback0
 ip address 192.168.254.7 255.255.255.255
 ip ospf 1 area 0
end

router ospf 1
 router-id 192.168.254.1
 mpls ldp autoconfig

l2 vfi 500 manual 
 vpn id 500
 bridge-domain 500
 mtu 1998
 neighbor 192.168.254.8 encapsulation mpls



# Swithces
interface Ethernet0/0
 switchport trunk encapsulation dot1q
 switchport trunk allowed vlan 500
 switchport mode trunk
 duplex auto
!
interface Ethernet0/1
 switchport access vlan 500
 switchport mode access
 duplex auto
!

vlan 500