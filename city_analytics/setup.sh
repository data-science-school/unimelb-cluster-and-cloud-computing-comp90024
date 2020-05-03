#!/bin/bash
ansible-galaxy install -r roles/requirements.yml  # install roles
chmod +x inventories/dynamic.py  # make script executable
inventories/dynamic.py --list  # test by retrieving instance information
ansible-playbook security_groups.yaml  # create security groups
ansible-playbook keypairs.yaml  # generate keypairs
ansible-playbook -i inventories/hosts.yaml instances.yaml  # launch compute instances
ansible-playbook -i inventories/hosts.yaml volumes.yaml  # create volumes
ansible-playbook -i inventories/hosts.yaml volumes_attach.yaml  # attach volumes to instances
ansible-playbook -i inventories/dynamic.py -i inventories/hosts.yaml inventory_export.yaml  # generate inventory file with IP addresses
ansible-playbook -i hosts proxy_config.yaml  # Add proxy to etc/environment and docker environment
#<<<<<<< HEAD
#ansible-playbook -i inventories/hosts_auto.ini dependencies.yaml  # install dependencies on servers
#=======
#=======
#ansible-playbook -i inventories/hosts_auto.ini dependencies.yaml  # install dependencies on servers
## ansible-playbook -i inventories/hosts_auto.ini -i inventories/group_vars/webservers.yaml common.yaml
## ansible-playbook -i inventories/hosts_auto.ini -i inventories/group_vars/webservers.yaml docker.yaml
#ansible-playbook -i inventories/hosts_auto.ini -i inventories/group_vars/webservers.yaml couchdb_setup.yaml --skip-tags "remove_directory" # Create couchDB cluster, (CAUTION) comment skip-tags to remove couchDB data on instance
#
#>>>>>>> 9965678262877d76819418506537d168c2202682
## ansible-galaxy install -r roles/requirements.yml  # install roles
## chmod +x inventories/dynamic.py  # make script executable
## inventories/dynamic.py --list  # test by retrieving instance information
## ansible-playbook security_groups.yaml  # create security groups
## ansible-playbook keypairs.yaml  # generate keypairs
## ansible-playbook -i inventories/hosts.yaml instances.yaml  # launch compute instances
#
## ansible-playbook -i inventories/hosts.yaml volumes.yaml  # create volumes
## ansible-playbook -i inventories/hosts.yaml volumes_attach.yaml  # attach volumes to instances
## ansible-playbook -i inventories/dynamic.py -i inventories/hosts.yaml inventory_export.yaml  # generate inventory file with IP addresses
## ansible-playbook -i inventories/hosts_auto.ini -i inventories/group_vars/webservers.yaml proxy_config.yaml  # Add proxy to etc/environment and docker environment
#
#
#
# Use for Debugging
# ansible-playbook -i inventories/hosts_auto.ini test.yaml
#
