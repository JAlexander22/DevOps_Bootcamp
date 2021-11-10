#DevOps In
## Life Before DevOps
BEFORE DEVOPS, the model used for software development was the “WATERFALL” Model. The waterfall model is a classical model used in system development life cycle to create a system with a linear and sequential approach. Disadvantages of waterfall model:

Makes changes difficult
Excludes the client and/or end user: As an internal process, the Waterfall methodology focuses very little on the end user or client involved with a project. Its main purpose has always been to help internal teams move more efficiently through the phases of a project.
Delays testing until after completion
### Why DevOps
DevOps is important because it's a software development and operations approach that enables faster development of new products and easier maintenance of existing deployments.
#### Key Pillars of DevOps
- Easy to use
- Cost effective
- Flexible
- Robust
##### Monolith Architecture
Its where all the code is composed in one piece. E.g. The front end, back end and the databases are written on a single file



### Development Environment
![](images/dev-env.png)

-**DevOps Introduction**
- DevOps is a culture that bridges the gap between Development
-
-
-**Life before DevOps**
- Waterfall-V-Model
- Transition to Agile and Scrum

- Create `vagrantfile` in the current location
```
Vagrant.configure("2") do |config|


config.vm.box = "ubuntu/xenial64"
# creating a virtual machine ubuntu


# assign private IP to our VM
config.vm.network "private_network", ip: "192.168.10.100"


# Ensure to install hostsupdater plugin on our local host
config.hostsupdater.aliases = ["development.local"]

end

```
- create `provision.sh`
```
#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
```
- Commands used today:
```
On the host machine:
- vagrant up (to run the Vagrantfile and create a VM using VB)
- vagrant status (the VM should be running after running vagrant with 'vagrant up')
- type the ip address on the host url bar to see if nginx is working e.g.
192.168.10.100
- vagrant ssh (to check if the nginx is running which should be if the nginx website opened up)
- vagrant destroy (to destroy the vagrant VM)
- rm -rf .Vagrantfile (after you destroyed the vagrant VM)

try these commands inside of the guest VM:
- systemsctl status nginx (to check the status of the nginx server)
- sudo systemsctl start nginx (starts the nginx server manually)
- sudo systemsctl stop nginx (stops the nginx server manually)
```

- Vagrant Commands:
```
Common commands:
     autocomplete    manages autocomplete installation on host
     box             manages boxes: installation, removal, etc.
     cloud           manages everything related to Vagrant Cloud
     destroy         stops and deletes all traces of the vagrant machine
     global-status   outputs status Vagrant environments for this user
     halt            stops the vagrant machine
     help            shows the help for a subcommand
     hostsupdater
     init            initializes a new Vagrant environment by creating a Vagrantfile
     login
     package         packages a running vagrant environment into a box
     plugin          manages plugins: install, uninstall, update, etc.
     port            displays information about guest port mappings
     powershell      connects to machine via powershell remoting
     provision       provisions the vagrant machine
     push            deploys code in this environment to a configured destination
     rdp             connects to machine via RDP
     reload          restarts vagrant machine, loads new Vagrantfile configuration
     resume          resume a suspended vagrant machine
     snapshot        manages snapshots: saving, restoring, etc.
     ssh             connects to machine via SSH
     ssh-config      outputs OpenSSH valid configuration to connect to the machine
     status          outputs status of the vagrant machine
     suspend         suspends the machine
     up              starts and provisions the vagrant environment
     upload          upload to machine via communicator
     validate        validates the Vagrantfile
     version         prints current and latest Vagrant version
     winrm           executes commands on a machine via WinRM
     winrm-config    outputs WinRM configuration to connect to the machine
```
-**Testing Dev Environment**
Run the Vagrant file and inside `Environment/Spec-test`, run the command `rake spec`, to check if tests for Vagrant works
- Start process of testing VM
1) Navigate to `environment/spec-tests`
2) `gem install bundler`
3) `bundler`
4) `rake spec`

- Commands done to pass test with App
```
sudo apt-get update -y
sudo apt-get install nodejs -y
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo npm install pm2 -g
```

- To Start app/
Navigate to folder app/app inside VM
```
npm install
npm install express
npm start
```
#### Linux Command
- Who am I `uname` or `uname -a`
- Where am I `pwd` will display current location
- How can I list contents including hidden files `ls -a`
- Delete file `rm filename` or `rm -rf filename`
- Create a file `touch filename` or `nano filename`
- Create a dir `mkdir dir_name`
- Navigate inside dir `cd name_dir`
- To view process `ps aux` or `top`
- To kill process `kill (porcess_id/s)`
- Wild card is used to deal with multiple files with same extension `*`
- File Permissions `chmod +execute(x) read(r) write(w)`
- Change permissions with numbers `chmod 644`
- To list all permissions in folder `ll` or `ls -l`


-** Environment Variables **
- `env` list all environment Variables
- `Variable_name=Variables` to create a Variable
- `export Variable_name=Variables` to create  an environment Variable
- `printenv Variable_name` to see global Variable
