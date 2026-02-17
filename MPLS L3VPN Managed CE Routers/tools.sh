# mengecek apakah access listnya sudah sesuai
R1#show bgp vpnv4 unicast rd 65000:21 192.168.254.6 255.255.255.255
BGP routing table entry for 65000:21:192.168.254.6/32, version 24
Paths: (1 available, best #1, table B1)
  Advertised to update-groups:
     1         
  Refresh Epoch 1
  65002
    10.1.6.6 from 10.1.6.6 (192.168.1.6)
      Origin IGP, metric 0, localpref 100, valid, external, best
      Extended Community: RT:65000:41
      mpls labels in/out 27/nolabel
      rx pathid: 0, tx pathid: 0x0

# Reset bgp ipv4 peer
R8#clear bgp ipv4 unicast *
