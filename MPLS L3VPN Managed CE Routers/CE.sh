# R5
ena
conf t
hostname R5
int eth 1/0
 no shutdown
 ip address 10.1.5.5 255.255.255.0

int eth 1/1
 no shutdown
 ip address 192.168.1.5 255.255.255.0

int loop0
 no shutdown
 ip address 192.168.254.5 255.255.255.255

router bgp 65001
 neighbor 10.1.5.1 remote-as 65000
 network 192.168.1.0 mask 255.255.255.0
 network 192.168.254.5 mask 255.255.255.255


# R6 (CE for VRF B1)
ena
conf t
hostname R6
int eth 1/2
 no shutdown
 ip address 10.1.6.6 255.255.255.0

int eth 1/0
 no shutdown
 ip address 192.168.3.6 255.255.255.0

int loop0
 no shutdown
 ip address 192.168.254.6 255.255.255.255

router bgp 65002
 neighbor 10.1.6.1 remote-as 65000
 network 192.168.3.0 mask 255.255.255.0
 network 192.168.254.6 mask 255.255.255.255

# R7 (CE for VRF C1)
ena
conf t
hostname R7
int eth 1/3
 no shutdown
 ip address 10.1.7.7 255.255.255.0

int eth 1/0
 no shutdown
 ip address 192.168.5.7 255.255.255.0

int loop0
 no shutdown
 ip address 192.168.254.7 255.255.255.255

router bgp 65003
 neighbor 10.1.7.1 remote-as 65000
 network 192.168.5.0 mask 255.255.255.0
 network 192.168.254.7 mask 255.255.255.255

# R8 (CE for VRF A2)
ena
conf t
hostname R8
int eth 1/0
 no shutdown
 ip address 10.4.8.8 255.255.255.0

int eth 1/1
 no shutdown
 ip address 192.168.2.8 255.255.255.0


int loop0
 no shutdown
 ip address 192.168.254.8 255.255.255.255

router bgp 65001
 neighbor 10.4.8.4 remote-as 65000
 network 192.168.2.0 mask 255.255.255.0
 network 192.168.254.8 mask 255.255.255.255

 # R9 (CE for VRF B2)
ena
conf t
hostname R9
int eth 1/2
 no shutdown
 ip address 10.4.9.9 255.255.255.0

int eth 1/0
 no shutdown
 ip address 192.168.4.9 255.255.255.0

int loop0
 no shutdown
 ip address 192.168.254.9 255.255.255.255

router bgp 65002
 neighbor 10.4.9.4 remote-as 65000
 network 192.168.4.0 mask 255.255.255.0
 network 192.168.254.9 mask 255.255.255.255


# R10 (CE for VRF C2)
ena
conf t
hostname R10
int eth 1/3
 no shutdown
 ip address 10.4.10.10 255.255.255.0

int eth 1/0
 no shutdown
 ip address 192.168.6.10 255.255.255.0

int loop0
 no shutdown
 ip address 192.168.254.10 255.255.255.255

router bgp 65003
 neighbor 10.4.10.4 remote-as 65000
 network 192.168.6.0 mask 255.255.255.0
 network 192.168.254.10 mask 255.255.255.255

