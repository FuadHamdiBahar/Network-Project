# R1
ena
conf t
hostname R1
int e1/0
no shut
desc Link to R2
ip ospf network point-to-point
ip addr 10.1.2.1 255.255.255.248
ip ospf 1 area 0

int loop0
no shut
ip addr 172.16.1.1 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 172.16.1.1

# R4
ena
conf t
hostname R4
int e1/0
no shut
desc Link to R3
ip ospf network point-to-point
ip addr 10.3.4.4 255.255.255.248
ip ospf 1 area 0

int loop0
no shut
ip addr 172.16.4.4 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 172.16.4.4

# R2
ena
conf t
hostname R2
int e1/0
no shut
desc Link to R1
ip ospf network point-to-point
ip addr 10.1.2.2 255.255.255.248
ip ospf 1 area 0

int e1/1
no shut
desc Link to R3
ip ospf network point-to-point
ip addr 10.2.3.2 255.255.255.248
ip ospf 1 area 0

router ospf 1
router-id 172.16.2.2

# R3
ena
conf t
hostname R3
int e1/0
no shut
desc Link to R4
ip ospf network point-to-point
ip addr 10.3.4.3 255.255.255.248
ip ospf 1 area 0

int e1/1
no shut
desc Link to R2
ip ospf network point-to-point
ip addr 10.2.3.3 255.255.255.248
ip ospf 1 area 0

router ospf 1
router-id 172.16.3.3

# BGP
# R1
router bgp 65000
bgp router-id 172.16.1.1
no bgp default ipv4-unicast
neighbor 172.16.4.4 remote-as 65000
neighbor 172.16.4.4 update-source Loopback0
address-family vpnv4
neighbor 172.16.4.4 activate

# R4
router bgp 65000
bgp router-id 172.16.4.4
no bgp default ipv4-unicast
neighbor 172.16.1.1 remote-as 65000
neighbor 172.16.1.1 update-source Loopback0
address-family vpnv4
neighbor 172.16.1.1 activate

# MPLS
# R1/R2/R3/R4
ena
conf t
router ospf 1
mpls ldp autoconfig

# VRF
# R1/R4
vrf definition A
rd 65000:1
address-family ipv4 
route-target both 65000:1

vrf definition B
rd 65000:2
address-family ipv4 
route-target both 65000:2

# R1
int eth1/1
no shut

int eth1/1.3
vrf forwarding A
encapsulation dot1q 3
ip addr 10.1.7.1 255.255.255.0
no shut

int eth1/1.2
vrf forwarding B
encapsulation dot1q 2
ip addr 10.1.8.1 255.255.255.0
no shut

#R4
int eth1/1
no shut

int eth1/1.3
vrf forwarding A
encapsulation dot1q 3
ip addr 10.4.9.4 255.255.255.0
no shut

int eth1/1.2
vrf forwarding B
encapsulation dot1q 2
ip addr 10.4.10.4 255.255.255.0
no shut

# R7
ena
conf t
hostname R7
int eth1/0
no shut
ip addr 10.1.7.7 255.255.255.0

int eth1/1
no shut
desc Link to Customer A site 1
ip addr 192.168.1.1 255.255.255.0

end
wr

# R8
ena
conf t
hostname R8
int eth1/2
no shut
ip addr 10.1.8.8 255.255.255.0

int eth1/0
no shut
desc Link to Customer B site 1
ip addr 192.168.1.1 255.255.255.0

end
wr

# R9
ena
conf t
hostname R9
int eth1/0
no shut
ip addr 10.4.9.9 255.255.255.0

int eth1/1
no shut
desc Link to Customer A site 2
ip addr 192.168.2.1 255.255.255.0

end
wr

# R10
ena
conf t
hostname R10
int eth1/2
no shut
ip addr 10.4.10.10 255.255.255.0

int eth1/0
no shut
desc Link to Customer B site 2
ip addr 192.168.2.1 255.255.255.0

end
wr

# R1
ip route vrf A 192.168.1.0 255.255.255.0 10.1.7.7
ip route vrf B 192.168.1.0 255.255.255.0 10.1.8.8

# R4
ip route vrf A 192.168.2.0 255.255.255.0 10.4.9.9
ip route vrf B 192.168.2.0 255.255.255.0 10.4.10.10

# R7
ip route 192.168.2.0 255.255.255.0 10.1.7.1

# R8
ip route 192.168.2.0 255.255.255.0 10.1.8.1

# R9
ip route 192.168.1.0 255.255.255.0 10.4.9.4

# R10
ip route 192.168.1.0 255.255.255.0 10.4.10.4

# R1/R4
router bgp 65000
address-family ipv4 vrf A
    redistribute static
address-family ipv4 vrf B
    redistribute static
