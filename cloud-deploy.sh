#!/bin/bash

ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook bare-metal/pve/ansible/deploy-pve.yml -i pve_hosts.ini
ansible-playbook bare-metal/net/ansible/deploy-network.yml -i pve_hosts.ini
ansible-playbook templates/ansible/install-basic-templates -i pve_hosts.ini