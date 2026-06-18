#!/bin/bash

ansible-playbook pve_nodes/pve/ansible/deploy.yml -i inventory.ini -e "@config_vars.yml"
ansible-playbook pve_nodes/net/ansible/deploy.yml -i inventory.ini -e "@config_vars.yml"
ansible-playbook pve_vms/cloud_templates/ansible/deploy.yml -i inventory.ini -e "@config_vars.yml"