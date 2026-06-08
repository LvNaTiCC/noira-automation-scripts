#!/bin/bash

ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook bare-metal/pve/ansible/deploy-pve.yml -i inventory.ini
ansible-playbook bare-metal/net/ansible/deploy-network.yml -i inventory.ini
ansible-playbook templates/ansible/install-basic-templates.yml -i inventory.ini
