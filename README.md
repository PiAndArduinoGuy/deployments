# Disclaimer
Artifacts that need to be deployed are not available in the artifacts directory as they are too large to be hosted by GitHub, please reach out to me if you want these artifacts
# Raspberry Pi IoT
The raspberry-pi-iot project consists of a central system called the *Control Hub* that orchestrates user interaction with a number of IoT devices on a private network.

## Installing Raspberry Pi OS
The Raspberry Pi OS needs to be installed on all Raspberry Pi devices. Steps to installing the OS have been included as a section on its own.
1. Install the *RaspberyPi OS Lite (32 bit)* operating system on an SD card using the [Raspberry Pi Imager software](https://www.raspberrypi.org/software/).
   * Select the *RaspberyPi OS Lite (32 bit)* image.
   * Insert the RaspberryPi SD card into you local machine and select it from the *CHOOSE STORAGE* list.
   * Open the *Advanced Options* pane by simulaeously hitting *Ctrl+Shift+X*.
      * Select *Enable SSH* and *Use password authentication* and enter a password you feel comfortable with for SSH-ing into the RaspberryPi later on.
      * In the case that your RaspberryPi has built in Wifi (RaspberryPi3+) and is the preferred means to connect to your private network, select *Configure wifi* and provide your Wifi specific SSID and password.
   * Click on *WRITE* (note that this will format the SD card and install the RaspberryPi OS onto it).

   For a video demonstration of how to perform the tasks mentioned follow the link [How to use Raspberry Pi Imager | Install Raspberry Pi OS to your Raspberry Pi (Raspbian)](https://www.youtube.com/watch?v=ntaXWS8Lk34).
2. Insert the SD card into your RaspberryPi and power it on.
3. Give the RaspberryPi time to connect to your private network, then find the IP address of your RaspberryPi by either logging into your router and opening the *Devices* tab or a similar option (depending on your router's make and model). Alternatively use a network utility like [netstat](https://linux.die.net/man/8/netstat) to determine the IP address of your RaspberryPi.

## Control Hub
The Control Hub runs on a RaspberryPi 2+, it facilitates communication between the Control Hub and IoT devices. In addition to this it serves a frontend coded in Angular and a backend coded in Java - the frontend and corresponding backend allow end-users to manage their IoT devices within their private networks.
### System Requirements
* Arm7+ CPU architecture (RaspberryPi2, RaspberryPi3, RaspberryPi4)
* Internet capabilities
* An SD card at least 4 GB in size

### Installing the Control Hub
As stated previously, the Control Hub comprises the Angular frontend and a number of micro-services to manage the IoT devices. Below are optional and mandatory steps to deploying components to get your control hub up and running.
To execute the tasks Ansible needs to be installed, follow the guide for your operating system [Installing Ansible on specific operating systems
](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-specific-operating-systems) (Windows is not supported). Once Ansible has been installed, disable host key checking by adding the value *host_key_checking = False* to your ansible.cfg file (for Ubuntu this file is located at */etc/ansible*), this allows a password only SSH connection with remote hosts. Next follow the set up instructions below to deploy the Control Hub onto your RaspberryPi.

#### Install the Control Hub Frontend (Required)
1. Clone this project and edit the *hosts.ini* file. Replace the IP address of the *[control_hub_frontend]* host with the IP address obtained in step 3 of _Installing Raspberry Pi OS_.
2. If your Raspberry Pi is connected to your router via an ethernet cable then open the *deploy_and_start_control_hub_frontend.yml* file located in the *playbooks* directory and uncomment the line interface: ethernet.
3. Next open a terminal on your local machine and *cd* to this project, execute *ansible-playbook deploy_and_start_control_hub_frontend.yml -i ../hosts.ini*. This will run a number of Ansible tasks that:
4. Visit the url *http://{your-ip-address-from-step-3}/control-hub-frontend* to interact with the Control Hub.

#### Install RabbitMQ Server (Required)
1. Replace the IP address of the *[rabbitmq]* host with the IP address obtained in step 3 of _Installing Raspberry Pi OS_.
2. Next open a terminal on your local machine and *cd* to this project, execute *ansible-playbook deploy_and_start_rabbitmq.yml -i ../hosts.ini*. This will run a number of Ansible tasks that:

#### Install the Security Micro Service (Required if implementing [this blog](here-is-link))
1. Replace the IP address of the *[security_camera_microservice]* host with the IP address obtained in step 3 of _Installing Raspberry Pi OS_.
2. Next open a terminal on your local machine and *cd* to this project, execute *ansible-playbook deploy_and_start_security_micro_service.yml -i ../hosts.ini*. This will run a number of Ansible tasks that:

## IoT Devices
### System Requirements
All IoT devices require the minimum system requirements below:
* Internet capabilities
* An SD card at least 4 GB in size
#### Installing Security Camera (Required if implementing [this blog](here-is-link))
1. Follows the steps to install the Raspberry Pi OS.
2. Replace the IP address of the *[security_camera_microservice]* host with the IP address of your Raspberry Pi in the hosts.ini file.
3. Next open a terminal on your local machine and *cd* to this project, execute *ansible-playbook deploy_and_start_security_camera_micro_service.yml -i ../hosts.ini*.
4. If you have a 3D printer then you can print the enclosure designed for the security camera, the STL files are available in the directory artifacts/other/enclosures 

#### Installing the Hardware Security Controller and Alerter (Required if implementing [this blog](here-is-link))
1. Replace the IP address of the *[alerter]* and *[hardware-security-controller]* host with the IP address obtained in step 3 in the hosts.ini file. 
2. Next open a terminal on your local machine and *cd* to this project, execute *ansible-playbook deploy_and_start_hardware_security_controller.yml -i ../hosts.ini*. 
3. Execute *ansible-playbook deploy_and_start_alerter.yml -i ../hosts.ini*.
4. If you have a 3D printer then you can print the enclosure designed for the hardware controller and alerter, the STL files are available in the directory artifacts/other/enclosures

# Contact Details
For any queries please feel free to contact me:
* email address: piandarduinoguy@gmail.com