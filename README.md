# Wireguard Demonstration
A repository containing setup files for the demonstration of usage of wireguard with namespaces. 

**Experiment 1**: It is about create a direct node to node topology. The script in Experiment1 does not configure the wireguard interfaces since thats taken up as an exercise in the first experiment. It only creates the initial topology. One may follow the demonstration video or the presentation to follow with the steps to create and configure the wireguard interfaces. 

**Experiment 2**: This is a setup with a relay/bouncing server and 2 VPN clients. This script configures all the wireguard interfaces for you as well apart from creating the topology. One may follow the demonstration to see observations one can make using tcpdump, traceroute and ping post running this script. 

**Experiment 3**: This is a setup with a VPN server, a VPN client, and a node outside the VPN network. This toplogy shows the namespace integration with wireguard to avoid classical routing table hacks. It also shows how wireguard can be used to access resources on a network outside the VPN securely. This script configures all the wireguard interfaces for you as well apart from creating the topology. One may follow the demonstration to see observations one can make using tcpdump, traceroute and ping post running this script. 

Author: 
Aditya Chirania
