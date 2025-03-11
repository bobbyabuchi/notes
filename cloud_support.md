### Cloud Support

#### Q1. Tell me about a situation that required you to dig deep to get to the root cause. How did you know you were focusing on the right things? What was the outcome? Would you have done anything differently?


#### Q2a. During boot up, you suddenly realise your OS is not coming up, how will you recover this?

1. I will assess the Situation
  - Are there any error messages or codes displayed during the boot process?
  - Figure out if it fails at a specific stage:
    - ```windows Boot Stages: POST - bootloader - kernel loading - session manager - Winlogon```
    - ```linux Boot Stages: bios/uefi - bootloader(GRUB/LILO - kernel init - init/system - login prompt)```
      - unified extensible firmware interface UEFI
      - basic input and output system BIOS
      - grand unified bootloader GRUB
      - linux loader LILO

2. Attempt to boot in safe mode

3. Check FIlesystem Integrty
   > ```chkdsk``` for windows and ```fsck```

4. Use Recovery Media/Startup Repair(Windows)

5. Reinstall bootloader

6. Rebooot and verify

#### Q2b. Using Command Line Tools

1. `curl`: testing api endpoints and downloading files from terminal
   
   > to test an API `curl -X GET https://api.keyapp.com/page`
   
   > to download a file `curl -0 https://keysite/file.zip`

2. `dig` to troubleshoot DNS issues 
   > query DNS records: `dig bobbyabuchi.co.uk`
   
   > check specific record types, A record and 

3. `iperf` test bandwith and throughput on network 
   
   > `iperf -s` # start a tcp server
   
   > `iperf -c <server-ip>`
   
   > `iperf -c <server-ip>` -u #for udp connection

4. `traceout` track the path packets and connectivity issues...
   
   > `tracerout bobbyabuchi.co.uk`
   
   > `tracerout -nI bobbyabuchi.co.uk` #skip DNS resolution
   
   > `tracerout -4 bobbyabuchi.co.uk` # tace network path only
   
   > `-T` flag for TCP where UPD (default tracerout conn) is blocked.

#### Q3a. What is a pod in Kubernetes?

> A Pod in Kubernetes is the smallest deployable unit. It also represents a single instance of a running process in a cluster. (they're managed by Deployments or StatefulSets)

#### Q3b. How would you troubleshoot a Pod?

1. check pod status - to get an overview of the pod's status and configuration
   
   > `kubectl get pods -o wide`

   > -o flag for more details (pod IP), `-o json` `-o yaml` output json and yaml formats respectively `-o name` displays the names of the pods

2. describe the pod - to get a detailed info about pod
   > `kubectl describe pod <pod-name>`

3. view logs - for insight on what the app inside the pod is doing or has done, error warning...
   > `kubectl logs <pod-name>` 

4. verify container image - ensure the correct container image and tag are in use 
    > `kubectl describe pod <pod-name> | grep Image`

5. check resource limits - ensure the pod's resource requests and limits are apt.
    > `kubectl describe pod <pod-name> | grep -i "limits\|requests"`

6. verify cluster state - check node and cluster health
    > ```
    > kubectl get nodes
    > kubectl get events --sort-by=.metadata.creationTimestamp
    > ```

7. debug with `exec` - use the pod's shell  to inspect files, test commands, or debug the app directly
   > `kubectl exec -it <pod-name> -- /bin/sh`

8.  replace the pod
    > `kubectl delete pod my-app-pod-123` # when u delete a pod kubernetes will spin up a replacement

#### Q3c. Tell me about a time you were deploying an application in Kubernetes cluster? Walk me through how you deployed the application?

> I was tasked with deploying a 3 tier web application on kubernetes

1. Setup Kubernetes Cluster
2. Created a Docker container image
3. Created kubernete deployment and service manifest
   1. Configured kubernetes cluster to trust local docker registry with self signed SSL certs
   2. created k8s application deployment manifest on master node
   3. created k8s app service manifest on master node
   4. verified the pods/containers logs
   5. logged in to a specific k8s pod or conainer in a pod
4. access k8s app

#### Q4a What happens when you type  a URL in your browser

1. DNS lookup: the browser resolves the domain name to an IP address
   > from `browser cache` to OS cache, router cache, DNS resolver query, recursive DNS query

2. TCP handshake: the browser establishes a TCP connection with the server
   > the SYN SYN-ACK ACK and FIN(for closing) 

3. TLS/SSL handshake: for HTTPS enable sites, secure connection is established
   > the Client Hello and Server Hello exchange, Server Certificate verification, cyrptographic key exchange, session keys generation and Client & Server Finish exchange.

4. HTTP request: browser sends an HTTP rquest (GET...) to the server

5. Server processing: the server processes the request and sends back an HTTP response (HTML, CSS, JS...)

6. Rendering: the browser renders the received contant and displays the webpage

#### Q4b. How would you assign an IP address to a system?

> For windows, I will: `ipconfig`

1. Goto control panel -> Networkans SharingCenter -> Change adapter settings -> (right-click)Properties -> internet Protocol Version 4 (TCP/IPv4) -> Properties -> Use the Following IP address -> Enter IP, subnet mask, and gateway. -> (Click) Ok to save.

2. Use the New-NetIPAddress cmdlet to set the IP address
   > ```
   > New-NetIPAddress -InterfaceAlias "<InterfaceName>" \
   >    -IPAddress <IPAddress> \
   >    -PrefixLength <SubnetPrefixLength> \
   >    -DefaultGateway <DefaultGateway>
   > ```

> Linux: lookup ip address `ip addr show` or `ifconfig` or `hostname -I`

1. use the nmcli or ip command: 
   > (temp IP?) `sudo ip addr add <IP>/<subnet> dev <interface>`
   
   > (perm IP?) edit the network config file in etc folder (`/etc/network/interfaces` or `/etc/sysconfig/network-scripts/ifcfg-<interface>`) and add 
   > ```
   > IPADDR=<IP>
   > NETMASK=<subnet>
   > GATEWAY=<gateway> 
   > ```

2. restart the network service
   > `sudo systemctl restart networking` 

#### As a Technical Support Engineer, I follow a structured approach to troubleshoot and resolve issues:

1. Understand the problem (gather as much information as possible)
   > asking clarifying questions, reviewing logs and actively listening to customer
2. Reproduce and isolate the problem

3. Analyse and diagnose
   > utilise monitoring tools and services like event view
4. implement solution 
5. test and confrim solution
6. document and share knowledge

---

For the Technical interviews you can expect the engineer to do a deep dive into your Operating Systems (Linux or Windows) and Networking technical skills/knowledge such as 

DNS, TCP/IP, Routing, Switching, firewalls, LAN/WAN, traceroute, iperf, DIG, cURL or related

I would recommend you to be prepared to demonstrate your knowledge of container-based technologies and related DevOps practices

Think about or write out 2 stories under Amazon Leadership Principles, utilizing the STAR method

·    Write 1 story on where have you solved a business problem utilizing those examples

·    Write 1 story on how you solved a functional/technical problem in your area of expertise (JD)

The Goal: Flush out your methodologies, processes, mechanisms and problem-solving fundamentals in your area of expertise.

What problem solving skills did you utilize and highlight different metric points. In each story showcase at least 2-5 Leadership Principles and how you used them to solve problems and outcomes (don’t repeat same stories or examples).

- Experience working with any of the container orchestration management tools such as Kubernetes, Docker Swarm. 

- Basic understanding of Container networking. 
- Good understanding of Linux, Networking concepts and protocols (DNS, TCP/IP, DHCP, HTTPS, OSI Model, FIlesystems, disk space, Memory, CPU issues ,Security, Encryptions etc.).

PREFERRED QUALIFICATIONS
- Knowledge or experience with application deployment pipelines (Git, SCM, Chef, Puppet, Jenkins, Ansible, or related tools), Docker and Kubernetes.

- Knowledge of the complete deployment lifecycle (design, build, test, deploy) including deployment methods such as Blue/Green, Rolling Deployments.
  
- Experience working with Iac (Terraform, CDK, Cloudformation).
  
- Knowledge or experience with any one scripting language.

- Understanding of cloud computing concepts and/or experience with any cloud platforms (AWS, Azure, Google Cloud).

#### About Amazon

> Tips: Overview, important details, examples, ask questions to clarify, be clear with the metrics and admit u do not know, do not guess rather show willingness to learn quickly. And communicate your thought process.
