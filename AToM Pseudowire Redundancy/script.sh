------------R1------------
ena 
conf t
hostname R1

int e1/0
no shut
ip addr 10.1.2.1 255.255.255.0
desc Link to R2
ip ospf 1 area 0

int e1/1
no shut
ip addr 10.1.4.1 255.255.255.0
desc Link to R4
ip ospf 1 area 0

int loop0
no shut
ip addr 1.1.1.1 255.255.255.255
ip ospf 1 area 0

------------R2------------
ena 
conf t
hostname R2

int e1/0
no shut
ip addr 10.1.2.2 255.255.255.0
desc Link to R1
ip ospf 1 area 0

int e1/1
no shut
ip addr 10.2.3.2 255.255.255.0
desc Link to R3
ip ospf 1 area 0

int loop0
no shut
ip addr 2.2.2.2 255.255.255.255
ip ospf 1 area 0

------------R3------------
ena 
conf t
hostname R3

int e1/1
no shut
ip addr 10.2.3.3 255.255.255.0
desc Link to R2
ip ospf 1 area 0

int e1/0
no shut
ip addr 10.3.6.3 255.255.255.0
desc Link to R6
ip ospf 1 area 0

int loop0
no shut
ip addr 3.3.3.3 255.255.255.255
ip ospf 1 area 0

------------R6------------
ena 
conf t
hostname R6

int e1/0
no shut
ip addr 10.3.6.6 255.255.255.0
desc Link to R3
ip ospf 1 area 0


int loop0
no shut
ip addr 6.6.6.6 255.255.255.255
ip ospf 1 area 0

------------R4------------
ena 
conf t
hostname R4

int e1/1
no shut
ip addr 10.1.4.4 255.255.255.0
desc Link to R1
ip ospf 1 area 0

int e1/0
no shut
ip addr 10.4.5.4 255.255.255.0
desc Link to R5
ip ospf 1 area 0

int loop0
no shut
ip addr 4.4.4.4 255.255.255.255
ip ospf 1 area 0

------------R5------------
ena 
conf t
hostname R5

int e1/0
no shut
ip addr 10.4.5.5 255.255.255.0
desc Link to R4
ip ospf 1 area 0

int e1/1
no shut
ip addr 10.5.7.5 255.255.255.0
desc Link to R7
ip ospf 1 area 0

int loop0
no shut
ip addr 5.5.5.5 255.255.255.255
ip ospf 1 area 0

------------R7------------
ena 
conf t
hostname R7

int e1/1
no shut
ip addr 10.5.7.7 255.255.255.0
desc Link to R5
ip ospf 1 area 0

int loop0
no shut
ip addr 7.7.7.7 255.255.255.255
ip ospf 1 area 0




#OSPF
router ospf 1
router-id 1.1.1.1
mpls ldp autoconfig

router ospf 1
router-id 2.2.2.2
mpls ldp autoconfig

router ospf 1
router-id 3.3.3.3
mpls ldp autoconfig

router ospf 1
router-id 6.6.6.6
mpls ldp autoconfig

router ospf 1
router-id 4.4.4.4
mpls ldp autoconfig

router ospf 1
router-id 5.5.5.5
mpls ldp autoconfig

router ospf 1
router-id 7.7.7.7
mpls ldp autoconfig


# VPLS Con
-----------R1-----------
pseudowire-class PW
encapsulation mpls

inte e1/2
xconnect 6.6.6.6 100 pw-class PW
backup peer 7.7.7.7 200 pw-class PW
backup delay 10 10
no shut

xconnect logging redundancy

-----------R6-----------
int e1/1
no shut
xconnect 1.1.1.1 100 encapsulation mpls

-----------R7-----------
int e1/2
no shut
xconnect 1.1.1.1 200 encapsulation mpls