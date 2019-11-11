# TB Challenge Project 

In AWS Console - creating EC2 instance - Linux AMI 

Saving the .pem file generated during creation and using the same to generate public key using putty and save it.

Connect the AMI via SSH using putty User: Ec2-user

Run the command ``sudo yum update -y`` to update all packages

#### Using configation management and provisioning tools to complete the tasks.

## Using Terraform to create Amazon Ubuntu EC2 instance

Terraform is a tool made by Hashicorp for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers ( aws, azure, Google cloud) as well as custom in-house solutions.

## Steps to provision
Download the terraform binary file https://www.terraform.io/downloads.html

Extract the zip file
make sure that the terraform binary is available on the PATH.
On the shell/terminal, go to the folder where terraform binary is extracted

```console
echo $"export PATH=\$PATH:$(pwd)" >> ~/.bash_profile
source ~/.bash_profile
```

make a new directory(can be named anything) and go inside the directory
mkdir terraform-july && cd terraform-july

Paste this following code to a file called 
### ``ubuntuec2.tf``

Replace the access_key and secret_access with your AWS IAM user credentials with enough permissions attached. You can go to IAM console on AWS to do this. First, go to the IAM management console iam

Then Click on the user's name and navigate to the security credentials tab. Click create access keys iam

Either download the csv file or, click show keys. Now you have both the access_key and secret_key required for the terraform code above. iam

initialize the working directory for terraform
``terraform init``
"The terraform init command is used to initialize a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe to run this command multiple times."

Provision the ec2 with this command
``terraform apply``

## Using Ansible to install nginx server

a) Create a common id on both the machines, for Example, ansible with SUDO privileges. This id will be used for communicating across all the machines involved for automation of tasks.

``useradd ansible``
``passwd ansible``
b) Edit the /etc/ssh/sshd_config file on the control machine and uncomment out the lines for PasswordAuthentication and PermitRootLogin

#### Edit the sshd_config file

#### Edit config file

Perform the above steps on both the machines. Once completed, restart the sshd service on both the machines.

``systemctl restart sshd``
c) For complete automation of tasks, we will need passwordless SSH authentication else the whole process will not be used if you have to key in the password every time.

So post the changes done above if we run the command ssh <target machine> and ssh <control machine> we will need to key in the password every time which is not the right procedure to execute Ansible tasks.

d) To enable passwordless authentication to perform the steps shown below. Firstly add the user ansible to the /etc/sudoers file on both the machines which will enable the user ansible to run any command which requires root privileges.

#### Add the user ansible

#### Save and exit the file after adding the user.

e) Going forward we will use the user ansible to perform all the steps. So switch to the user ansible.

Control Machine su – ansible AND Target Machine su – ansible

#### user ansible

Control Machine ssh-keygen

Control Machine-ssh-keygen

Target Machine ``ssh-keygen``

#### Target Machine -ssh-keygen

Copy the ssh key to the target machine and vice versa.

Control Machine ``ssh-copy-id <IP-Address-Host-Machine>``

#### Control Machine-ssh-copy-id

Target Machine ``ssh-copy-id <IP-Address-Control-Machine>``

#### Target Machine-ssh-copy-id

We are now able to log in without entering the password. After the check out of the ssh connectivity on both the machines and be logged in as ansible user.

Control Machine: ``ssh ansible@<IP-Address-Host-Machine``

#### Control Machine- login without pwd

Target Machine: ``ssh ansible@<IP-Address-Control-Machine>``

#### Target machine- login without pwd

f) Install wget if not installed on both the machines.

``$ sudo yum install wget -y``
g) We can now install ansible on the Control machine only by enabling the EPEL repo from fedora which provides add-on software packages. Perform the following steps to install ANSIBLE.

````
$ wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
$ sudo rpm -ivh epel-release-latest-7.noarch.rpm
$ sudo yum install ansible -y 
$ ansible --version 
The ansible version used is 2.8.5
````

h) Edit the ansible.cfg file and enable the inventory file parameter on the Control machine.

``$ sudo vi /etc/ansible/ansible.cfg``
#### enable the inventory file parameter on the Control machine

i) Ansible uses the concept of Inventory to manage and track the target machines. By default, this file is located in /etc/ansible/hosts and can be changed as well. A host file consists of groups for better classification and multiple machines under the group. All the required machines can be added to those groups.

Every group is denoted by a square bracket and a group name within. A server can actually exist in multiple groups.

Edit the inventory file /etc/ansible/hosts and add all the servers which need to be managed.

#### Add all the servers which needs to be managed

j) To test the connectivity of the servers under the webserver's group run the ansible ping command as shown. Here ping is a module which performs a particular function to test whether the hosts can be connected as defined in the inventory file or not. We will see more about various modules and its examples in the next section.

``$ ansible webservers –m ping``

#### To test the connectivity of the servers

To list the hosts in the inventory file, you can run the below command

 ``$ ansible webservers --list-hosts``
 
 #### Once everything is set-up run the ansible playbook
  ### ``ansible-playbook nginxnew1.yml``
  
 
