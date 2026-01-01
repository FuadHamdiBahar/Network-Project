# Basic Configuration
-----------------------R1-----------------------
int g1
no shut
ip addr 172.16.1.1 255.255.255.252
desc Link to R2
ip ospf 1 area 0

int g4
no shut
ip addr 172.16.1.5 255.255.255.252
desc Link to R3
ip ospf 1 area 0

int loop0
no shut
ip addr 1.1.1.1 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 1.1.1.1
mpls ldp autoconfig

end
wr


-----------------------R2-----------------------
int g1
no shut
ip addr 172.16.1.2 255.255.255.252
desc Link to R1
ip ospf 1 area 0

int g5
no shut
ip addr 172.16.1.9 255.255.255.252
desc Link to R3
ip ospf 1 area 0

int loop0
no shut
ip addr 2.2.2.2 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 2.2.2.2
mpls ldp autoconfig

end
wr


-----------------------R3-----------------------
int g4
no shut
ip addr 172.16.1.6 255.255.255.252
desc Link to R1
ip ospf 1 area 0

int g5
no shut
ip addr 172.16.1.10 255.255.255.252
desc Link to R2
ip ospf 1 area 0

int loop0
no shut
ip addr 3.3.3.3 255.255.255.255
ip ospf 1 area 0

router ospf 1
router-id 3.3.3.3
mpls ldp autoconfig

end
wr


# VPLS Configuration
-----------------------R1/R2/R3-----------------------
int g2
no shut
service instance 10 ethernet
encapsulation dot1q 10
rewrite ingress tag pop 1 symmetric
end
wr

# Pseudowire
-----------------------R1-----------------------
int pse12
encapsulation mpls
neig 2.2.2.2 10

int pse13
encapsulation mpls
neig 3.3.3.3 10
end
wr

-----------------------R2-----------------------
int pse21
encapsulation mpls
neig 1.1.1.1 10

int pse23
encapsulation mpls
neig 3.3.3.3 10
end
wr

-----------------------R3-----------------------
int pse31
encapsulation mpls
neig 1.1.1.1 10

int pse32
encapsulation mpls
neig 2.2.2.2 10
end
wr

#l2vpn
l2vpn vfi context 10
vpn id 10
member pse 12
member pse 13

l2vpn vfi context 10
vpn id 10
member pse 21
member pse 23

l2vpn vfi context 10
vpn id 10
member pse 31
member pse 32

# Bridge Domain
bridge- 10
member vfi 10
member gig 2 servi 10

# CE
-----------C1E1-----------
int g0/2
no shut
int g0/2.10
encapsulation dot1q 10
ip addr 192.168.1.1 255.255.255.0

-----------C1E2-----------
int g0/2
no shut
int g0/2.10
encapsulation dot1q 10
ip addr 192.168.1.2 255.255.255.0

-----------C1E3-----------
int g0/2
no shut
int g0/2.10
encapsulation dot1q 10
ip addr 192.168.1.3 255.255.255.0


# VPLS
-----------C1E1/C1E2/C1E3-----------
int g0/2.10
ip ospf 1 area 0

router ospf 1

# Let us finish the rest
# VPLS Configuration
-----------------------R1/R2-----------------------
int g3
desc Link to C2
no shut
service instance 20 ethernet
desc C2 Servicese
encapsulation dot1q 20
rewrite ingress tag pop 1 symmetric

# Pseudowire
-----------------------R1/R2-----------------------
int pse12
encapsulation mpls
neig 2.2.2.2 20

int pse21
encapsulation mpls
neig 1.1.1.1 20

# Bridge Domain
bridge- 20
member gig 3 servi 20

# CE
-----------C1E1-----------
int g0/3
no shut
int g0/3.20
encapsulation dot1q 20
ip addr 192.168.2.1 255.255.255.0

-----------C1E2-----------
int g0/3
no shut
int g0/3.20
encapsulation dot1q 20
ip addr 192.168.2.2 255.255.255.0

Tidak bisa karena VFI nya tidak bisa member psedo untu C2