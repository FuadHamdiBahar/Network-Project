# R1 and R4
router bgp 65000
 no bgp default ipv4-unicast
 neighbor 192.168.254.11 remote-as 65000
 neighbor 192.168.254.11 update-source Loopback0
 address-family vpnv4
  neighbor 192.168.254.11 activate

# R11
router bgp 65000
 no bgp default ipv4-unicast
 neighbor 192.168.254.1 remote-as 65000
 neighbor 192.168.254.1 update-source Loopback0
 neighbor 192.168.254.4 remote-as 65000
 neighbor 192.168.254.4 update-source Loopback0
 address-family vpnv4
  neighbor 192.168.254.1 activate
  neighbor 192.168.254.4 activate
  neighbor 192.168.254.1 route-reflector-client
  neighbor 192.168.254.4 route-reflector-client