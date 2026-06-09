#!/bin/bash

ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook bare-metal/pve/ansible/deploy-pve.yml -i inventory.ini -e "@config_vars.yml"
ansible-playbook bare-metal/net/ansible/deploy-network.yml -i inventory.ini -e "@config_vars.yml"
ansible-playbook templates/ansible/install-basic-templates.yml -i inventory.ini -e "@config_vars.yml"

#TODO Move all group-vars into a repo root, pass it via commands above