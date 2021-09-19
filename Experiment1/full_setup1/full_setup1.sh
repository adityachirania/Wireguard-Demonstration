ip netns add Node1
ip netns add Node2
ip link add eth0 type veth peer eth1
ip link set eth0 netns Node1
ip link set eth1 netns Node2
ip netns exec Node1 ip address add 192.168.1.1/24 dev eth0
ip netns exec Node2 ip address add 192.168.1.2/24 dev eth1
ip netns exec Node1 ip link set eth0 up
ip netns exec Node2 ip link set eth1 up
ip netns exec Node1 ip link set lo up
ip netns exec Node2 ip link set lo up  

echo "Topologies made successfully.."

ip netns exec Node1 ip link add wg0 type wireguard
ip netns exec Node1 ip addr add 10.0.0.1/24 dev wg0
ip netns exec Node1 wg set wg0 private-key ./keys/private_node1 listen-port 41251
ip netns exec Node1 wg set wg0 peer $(cat ./keys/public_node2) allowed-ips 10.0.0.2/32 endpoint 192.168.1.2:41250
ip netns exec Node1 ip link set wg0 up 

ip netns exec Node2 ip link add wg0 type wireguard
ip netns exec Node2 ip addr add 10.0.0.2/24 dev wg0
ip netns exec Node2 wg set wg0 private-key ./keys/private_node2 listen-port 41250
ip netns exec Node2 wg set wg0 peer $(cat ./keys/public_node1) allowed-ips 10.0.0.1/32 endpoint 192.168.1.2:41251
ip netns exec Node2 ip link set wg0 up 

echo "Wireguard interfaces added successfully.."