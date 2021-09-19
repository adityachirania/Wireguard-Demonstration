ip netns add Node1
ip netns add Node2
ip netns add Node3 

ip link add eth0 type veth peer eth1
ip link add eth2 type veth peer eth3

ip link set eth0 netns Node1
ip link set eth1 netns Node2
ip link set eth2 netns Node2
ip link set eth3 netns Node3 

ip netns exec Node1 ip addr add 192.168.1.1/24 dev eth0
ip netns exec Node2 ip addr add 192.168.1.2/24 dev eth1
ip netns exec Node2 ip addr add 172.16.0.1/24 dev eth2
ip netns exec Node3 ip addr add 172.16.0.2/24 dev eth3

ip netns exec Node1 ip link set eth0 up
ip netns exec Node1 ip link set lo up

ip netns exec Node2 ip link set eth1 up
ip netns exec Node2 ip link set eth2 up
ip netns exec Node2 ip link set lo up

ip netns exec Node3 ip link set eth3 up
ip netns exec Node3 ip link set lo up

ip netns exec Node1 ip route add default via 192.168.1.2 
ip netns exec Node2 sysctl -n net.ipv4.ip_forward=1 
ip netns exec Node3 ip route add default via 172.16.0.1

echo "Topologies made successfully.."

ip netns exec Node2 ip link add wg0 type wireguard
ip netns exec Node2 ip addr add 10.0.0.2/24 dev wg0
ip netns exec Node2 wg set wg0 private-key ./keys/private_node2 listen-port 41250
ip netns exec Node2 wg set wg0 peer $(cat ./keys/public_node1) allowed-ips 10.0.0.1/32 endpoint 192.168.1.2:41251
ip netns exec Node2 wg set wg0 peer $(cat ./keys/public_node3) allowed-ips 10.0.0.3/32 endpoint 172.16.0.2:41252
ip netns exec Node2 ip link set wg0 up 

ip netns exec Node1 ip link add wg0 type wireguard
ip netns exec Node1 ip addr add 10.0.0.1/24 dev wg0
ip netns exec Node1 wg set wg0 private-key ./keys/private_node1 listen-port 41251
ip netns exec Node1 wg set wg0 peer $(cat ./keys/public_node2) allowed-ips 10.0.0.0/24 endpoint 192.168.1.2:41250
ip netns exec Node1 ip link set wg0 up 

ip netns exec Node3 ip link add wg0 type wireguard
ip netns exec Node3 ip addr add 10.0.0.3/24 dev wg0
ip netns exec Node3 wg set wg0 private-key ./keys/private_node3 listen-port 41252
ip netns exec Node3 wg set wg0 peer $(cat ./keys/public_node2) allowed-ips 10.0.0.0/24 endpoint 172.16.0.1:41250
ip netns exec Node3 ip link set wg0 up 

echo "Wireguard interfaces added successfully.."