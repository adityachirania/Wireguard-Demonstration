# Wireguard Demonstration
A repository containing setup files for the demonstration of usage of wireguard with namespaces. 

***Important Note:The setup.sh files in each Experiment's folders may not complete the entire setup to run simulations. One would need to follow along with the presentation to know the extra commands necessary to complete the experimental setup. Also if one wishes to directly create the entire setup with a single bash script to directly start with the experiments, please run the bash scripts inside the full_setup folders present inside each experiment's folder instead.
Also if you wish to confirgure the wireguard interfaces yourself in Experiment2 and Experiment3, please comment out the latter section (the section that confgures the wireguard interfaces is clearly indicated in the script) in their respective bash setup.sh files.***

## Experiment 1

It is about create a direct node to node topology.It only creates the initial topology. One may follow the demonstration video or the presentation to follow with the steps to create and configure the wireguard interfaces.
-  **setup1.sh** - This file will create the topology for you and one may continue configuring wireguard interfaces following the presentation parallely. 
-  **clean_setup1.sh** - This will delete all namespaces created to perform the simulation. 
-  **full_setup1/** 
    - **full_setup1.sh** - This will directly create all namespaces and configure all the wireguard interfaces.
    - **keys/** - This has the key pairs that the wireguard interfaces will use.
    - **clean_setup1.sh** - This will delete all namespaces created to perform the simulation. 

![Screenshot from 2021-09-19 08-34-30](https://user-images.githubusercontent.com/52464668/133916029-c4cfb561-e7ca-4db1-b619-81c7f80a5bff.png)

## Experiment 2

This is a setup with a relay/bouncing server and 2 VPN clients.  One may follow the demonstration to see observations one can make using tcpdump, traceroute and ping post running this script. 

-  **setup2.sh** - This file will create the topology for you and configure all the wireguard interfaces. This time the wireguard interfaces are pre configured in the script because Experiment1 has already taught how one must configure any wireguard interface. 
-  **clean_setup2.sh** - This will delete all namespaces created to perform the simulation. 
-  **keys/** - This has the key pairs that the wireguard interfaces will use.
-  **full_setup2/** 
    - **full_setup2.sh** - This will directly create all namespaces and configure all the wireguard interfaces.
    - **keys/** - This has the key pairs that the wireguard interfaces will use.
    - **clean_setup2.sh** - This will delete all namespaces created to perform the simulation. 

![Screenshot from 2021-09-19 09-04-31](https://user-images.githubusercontent.com/52464668/133916008-246d1153-c770-46cf-aad2-79f98355f4a0.png)


## Experiment 3

This is a setup with a VPN server, a VPN client, and a node outside the VPN network. This toplogy shows the namespace integration with wireguard to avoid classical routing table hacks. It also shows how wireguard can be used to access resources on a network outside the VPN securely. One may follow the demonstration to see observations one can make using tcpdump, traceroute and ping post running this script. 

-  **setup3.sh** - This file will create the topology for you and configure all wireguard interfaces. This time the wireguard interfaces are pre configured in the script because Experiment1 has already taught how one must configure any wireguard interface. But how must enable the NAT gateway at the VPN server must be followed in the demonstration.  
-  **clean_setup3.sh** - This will delete all namespaces created to perform the simulation. 
-  **keys/** - This has the key pairs that the wireguard interfaces will use.
-  **full_setup2/** 
    - **full_setup3.sh** - This will directly create all namespaces, configure all the wireguard interfaces, and enable the NAT gateway at the VPN server. 
    - **keys/** - This has the key pairs that the wireguard interfaces will use.
    - **clean_setup3.sh** - This will delete all namespaces created to perform the simulation. 

![Screenshot from 2021-09-19 09-04-20](https://user-images.githubusercontent.com/52464668/133916039-2beaecb2-6ae9-4a30-926d-1806ef64bf29.png)

**Author:** 
Aditya Chirania
