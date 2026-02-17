router bgp 65000
 address-family ipv4 vrf A1
  neighbor 10.1.5.5 remote-as 65001
  neighbor 10.1.5.5 as-override
 address-family ipv4 vrf B1
  neighbor 10.1.6.6 remote-as 65002
  neighbor 10.1.6.6 as-override
 address-family ipv4 vrf C1
  neighbor 10.1.7.7 remote-as 65003
  neighbor 10.1.7.7 as-override

router bgp 65000
 address-family ipv4 vrf A2
  neighbor 10.4.8.8 remote-as 65001
  neighbor 10.4.8.8 as-override
 address-family ipv4 vrf B2
  neighbor 10.4.9.9 remote-as 65002
  neighbor 10.4.9.9 as-override
 address-family ipv4 vrf C2
  neighbor 10.4.10.10 remote-as 65003
  neighbor 10.4.10.10 as-override