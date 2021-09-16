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
