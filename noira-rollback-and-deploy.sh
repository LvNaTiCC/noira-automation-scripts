#!/bin/bash

ansible-playbook bare-metal/pve/ansible/rollback-to-clean-standalone.yml -i inventory.ini -e "@config_vars.yml"
ansible-playbook bare-metal/pve/ansible/deploy-pve.yml -i inventory.ini -e "@config_vars.yml" --skip-tags base_deployment
ansible-playbook bare-metal/net/ansible/deploy-network.yml -i inventory.ini -e "@config_vars.yml"
ansible-playbook templates/ansible/install-basic-templates.yml -i inventory.ini -e "@config_vars.yml"