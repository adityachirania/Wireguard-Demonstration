# Wireguard Demonstration
A repository containing setup files for the demonstration of usage of wireguard with namespaces. 

#### *Important Note: The setup.sh files in each Experiment's folders may not complete the entire setup to run simulations. One would need to follow along with the presentation to know the extra commands necessary to complete the experimental setup. Also if one wishes to directly create the entire setup with a single bash script to directly start with the experiments, please run full_setup.sh instead in the experiment folders.*

## Experiment 1

It is about create a direct node to node topology.It only creates the initial topology. One may follow the demonstration video or the presentation to follow with the steps to create and configure the wireguard interfaces. 

## Experiment 2

This is a setup with a relay/bouncing server and 2 VPN clients.  One may follow the demonstration to see observations one can make using tcpdump, traceroute and ping post running this script. 

## Experiment 3

This is a setup with a VPN server, a VPN client, and a node outside the VPN network. This toplogy shows the namespace integration with wireguard to avoid classical routing table hacks. It also shows how wireguard can be used to access resources on a network outside the VPN securely. One may follow the demonstration to see observations one can make using tcpdump, traceroute and ping post running this script. 



**Author:** 
Aditya Chirania
