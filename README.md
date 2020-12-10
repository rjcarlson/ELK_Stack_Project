## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

|[Network Diagram](https://github.com/rjcarlson/ELK_Stack_Project/Diagrams/Project_1_Network_diagram_20201202.png "ELK Stack Network Diagram”)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, running select playbook yaml files may be used to install only certain pieces of it, such as Filebeat.

![DVWA playbook](https://github.com/rjcarlson/ELK_Stack_Project/Ansible/dvwa-playbook.yml “DVWA Playbook”) 
![ELK playbook](https://github.com/rjcarlson/ELK_Stack_Project/Ansible/install-elk.yml “ELK Playbook”) 
![Pen Test playbook](https://github.com/rjcarlson/ELK_Stack_Project/Ansible/pentest.yml “Pentration Docker Container Playbook”) 
![Filebeat playbook](https://github.com/rjcarlson/ELK_Stack_Project/Ansible/roles/filebeat-playbook.yml “Filebeat Playbook”) 
![Metricbeat playbook](https://github.com/rjcarlson/ELK_Stack_Project/Ansible/roles/metricbeat-playbook.yml “Metricbeat Playbook”) 
![Filebeat Config file](https://github.com/rjcarlson/ELK_Stack_Project/Ansible/files/filebeat-config.yml “Filebeat Configuration File”) 
![Metricbeat Config file](https://github.com/rjcarlson/ELK_Stack_Project/Ansible/files/metricbeat-config.yml “Metricbeat Configuration File”) 



This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.  By distributing load across multiple servers, load balancing also mitigates DoS attacks. And using the health probe functionality, the load balancer can maintain application availability even when servers in the pool become unavailable. 
Using a Jump-box provide several advantages.  It restricts public access to the network, thereby reducing the number of connections that require securing and monitoring.  Implementing a jump box using ansbile provides a way to quickly and repeatably deploy web applications and ELK stack.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the website/web application and system files.
Filebeat gathers the logs of any servers its installed on and forewards them to the ELK server for storage and analysis typically through kibana.  
Metricbeat monitors the health of the web servers.  This includes basic HW status = CPU, memory, disk space  up to system and service statistics.

The configuration details of each machine may be found below.
| Name     | Function   | IP Address              | Operating System   | 
|----------|------------|-------------------------|--------------------| 
| Jump Box | Gateway    | 52.148.154.173/10.0.0.4 | Linux/ubuntu 18.04 | 
| Web1     | Webserver  | 10.0.0.7                | Linux/ubuntu 18.04 | 
| Web2     | Webserver  | 10.0.0.8                | Linux/ubuntu 18.04 | 
| ELK-VM   | ELK server | 104.40.92.88/10.1.0.4   | Linux/ubuntu 18.04 | 

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump-box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 
![Inbound Security Rules](./Diagrams/inbound_security_rules.png “Inbound Security Rules”)
![Jump Box accessible IP](./Diagrams/jump-box_accessible_IP.png “Jump Box Accessible IP”)

Machines within the network can only be accessed by my computer via the jump box.
![Inbound Security Rule for Kibana](./Diagrams/inbound_security_rules_kibana.png “Inbound Security Rule Kibana”)

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 66.58.183.53         |
| Web1     | No                  | 10.0.0.4             |
| Web2     | No                  | 10.0.0.4             |
| ELK      | No                  | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because this provides all web servers in the load pool will be configured exactly the same while eliminating manual errors. 

The playbook implements the following tasks: 
- installs docker 
- installs python3 
- installs and launches docker via python 
- increases the virtual memory 
- downloads and launches ELK image 
- publishes ports used

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![ELK Docker ps output](./Diagrams/docker_ps_output.png “ELK Docker PS output”)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web1 (10.0.0.7) 
- Web2 (10.0.0.8)

We have installed the following Beats on these machines:
- Web1 (10.0.0.7) 
- Web2 (10.0.0.8)

These Beats allow us to collect the following information from each machine:
- Filebeats gathers the log files from the web servers and then forwards them to the ELK server for storage and analysis.  Once on the ELK server, the data can b e analyzed for web functionality and intrusion detection. 
- Metricbeats monitors the VMs HW and system files.  This will help administrators determine if/when additional resources are needed to ensure the web applications run efficiently.  Also, it will allow administrators monitor the server systems for possible intrusion.    

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the yaml file to ansible container running on the provisioner (jump-box).
- Update the yaml file to include the modules to install and target VMs
- Run the playbook, then navigate to target VM to check that the installation worked as expected.

Here is a list of the ansible playbooks, which can be found in the Ansible folder:
- dvwa-playbook.yml (for webservers vm)
- install-elk.yml (for elk vm)
- pentest.yml (for pentration testing vm)

The following playbooks are in the Ansible/roles folder:
- filebeat-playbook.yml (for webserver vms)
- metricbeat-playbook.yml (for webservers vms)
These playbooks refers configuration files in the Ansible/files folder

You navigate to the ELK server public IP:5601/app/kibana to make sure all services are up and running and logging is in progress.
