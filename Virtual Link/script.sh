# R1
ena
conf t 
hostname R1
int loop0
ip addr 10.1.1.1 255.255.255.255
no shut

int e1/0
no shut
ip addr 10.1.2.1 255.255.255.0

int e1/1
no shut
ip addr 10.1.4.1 255.255.255.0

router ospf 100
router-id 10.1.1.1
network 10.1.4.1 0.0.0.0 area 0
network 10.1.2.1 0.0.0.0 area 1
network 10.1.1.1 0.0.0.0 area 0

end 
wr

# R4
ena
conf t 
hostname R4
int loop0
ip addr 10.4.4.4 255.255.255.255
no shut

int e1/1
no shut
ip addr 10.1.4.4 255.255.255.0

router ospf 100
router-id 10.4.4.4
network 10.1.4.4 0.0.0.0 area 0
network 10.4.4.4 0.0.0.0 area 0

end
wr

# R2
ena
conf t 
hostname R2
int loop0
ip addr 10.2.2.2 255.255.255.255
no shut

int e1/0
no shut
ip addr 10.1.2.2 255.255.255.0

int e1/1
no shut
ip addr 10.2.3.2 255.255.255.0

router ospf 100
router-id 10.2.2.2
network 10.1.2.2 0.0.0.0 area 1
network 10.2.3.2 0.0.0.0 area 1
network 10.2.2.2 0.0.0.0 area 1

# R3
ena
conf t 
hostname R3
int loop0
ip addr 10.3.3.3 255.255.255.255
no shut

int gi0/1
no shut
ip addr 10.2.3.3 255.255.255.0

int gi0/0
no shut
ip addr 10.3.5.3 255.255.255.0

router ospf 100
router-id 10.3.3.3
network 10.2.3.3 0.0.0.0 area 1
network 10.3.3.3 0.0.0.0 area 1
network 10.3.5.3 0.0.0.0 area 2

# R5
ena
conf t 
hostname R5
int loop0
ip addr 10.5.5.5 255.255.255.255
no shut

int gi0/0
no shut
ip addr 10.3.5.5 255.255.255.0

router ospf 100
router-id 10.5.5.5
network 10.3.5.5 0.0.0.0 area 2
network 10.5.5.5 0.0.0.0 area 2

# Virtual Links Configuration

# R1
router ospf 100
area 1 virtual-link 10.3.3.3

# R3
router ospf 100
area 1 virtual-link 10.1.1.1