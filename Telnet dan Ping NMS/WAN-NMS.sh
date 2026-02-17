Router#show running-config interface gigabitEthernet 1
Building configuration...

Current configuration : 212 bytes
!
interface GigabitEthernet1
 no ip address
 negotiation auto
 no mop enabled
 no mop sysid
 service instance 13 ethernet
  encapsulation dot1q 13
  rewrite ingress tag pop 1 symmetric
  bridge-domain 13
 !
end

Router#sh run vrf WAN-NMS
Building configuration...

Current configuration : 186 bytes
vrf definition WAN-NMS
 !
 address-family ipv4
 exit-address-family
!
!
interface BDI13
 vrf forwarding WAN-NMS
 ip address 10.10.10.1 255.255.255.0
 no mop enabled
 no mop sysid
!
end


# Switch 1 and Switch 2
S6#show running-config interface ethernet 0/0
Building configuration...

Current configuration : 103 bytes
!
interface Ethernet0/0
 switchport trunk encapsulation dot1q
 switchport mode trunk
 duplex auto
end

S6#show running-config interface ethernet 0/1
Building configuration...

Current configuration : 103 bytes
!
interface Ethernet0/1
 switchport trunk encapsulation dot1q
 switchport mode trunk
 duplex auto
end

S6#sh run int vl 13
Building configuration...

Current configuration : 61 bytes
!
interface Vlan13
 ip address 10.10.10.2 255.255.255.0
end

Switch(config)# line vty 0 4
Switch(config-line)# password cisco
Switch(config-line)# login
Switch(config-line)# transport input telnet ssh
Switch(config-line)# exit
!
! Also set an enable password (required for remote access)
Switch(config)# enable password cisco
Switch(config)# ip default-gateway 10.10.10.1

# cara masuk telnetnya
Router#telnet 10.10.10.2 /vrf WAN-NMS