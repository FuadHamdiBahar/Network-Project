# R1
access-list 1 permit 192.168.254.0 0.0.0.255
route-map LP permit 10
    match ip address 1
    set extcommunity rt 65000:41

router bgp 65000
vrf definition A1
 address-family ipv4
  export map LP
vrf definition B1
 address-family ipv4
  export map LP
vrf definition C1
 address-family ipv4
  export map LP

# R4
access-list 1 permit 192.168.254.0 0.0.0.255
route-map LP permit 10
    match ip address 1
    set extcommunity rt 65000:41

router bgp 65000
vrf definition A2
 address-family ipv4
  export map LP
vrf definition B2
 address-family ipv4
  export map LP
vrf definition C2
 address-family ipv4
  export map LP