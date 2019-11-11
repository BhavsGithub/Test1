# TB Challenge Project

## Using configation management and provisioning tools to complete the tasks.

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
``ubuntuec2.tf``
Replace the access_key and secret_access with your AWS IAM user credentials with enough permissions attached. You can go to IAM console on AWS to do this. First, go to the IAM management console iam

Then Click on the user's name and navigate to the security credentials tab. Click create access keys iam

Either download the csv file or, click show keys. Now you have both the access_key and secret_key required for the terraform code above. iam

initialize the working directory for terraform
``terraform init``
"The terraform init command is used to initialize a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe to run this command multiple times."

Provision the ec2 with this command
``terraform apply``
