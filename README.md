# VM Template Preparation Script

This script can be used for preparing a Red Hat Enterprise Linux/CentOS 6 VM to be used as a template. It was specifically designed for use in a VMware vSphere environment but can be adapted for other platforms as well.

The script was heavily inspired by Bob Plankers in his [Preparing Linux Template VMs](https://lonesysadmin.net/2013/03/26/preparing-linux-template-vms/) post.

## Instructions

1. Copy the script to `/root` on your VM.
2. Make the script executable ```chmod u+x /root/vm_template_prep.sh```.
3. Run the script as the last step before converting the VM into a template. The script will perform some cleanup actions on the VM and then power it down.

A typical workflow will involve:

1. Creating a VM with a base OS installation.
2. Setting up temporary networking to fetch updates.
3. Running ```yum update -y```.
4. Rebooting to install a new kernel (if necessary).
5. Installing/upgrading VMware Tools. Rebooting again after the kernel compilation.
6. Running the template preparation script.
7. Converting the VM into a template.
