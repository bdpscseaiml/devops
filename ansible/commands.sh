#!/bin/bash
ansible web01 -m ping -i inventory/inventory.yml

# ansible.builtin.apt
ansible db01 -m ansible.builtin.apt -a "name=apache2 state=present" -i inventory/inventory_group.yml --become


# ansible.builtin.copy
ansible db01 -m ansible.builtin.copy -a "src=src/index.html dest=/var/www/html/index.html" -i inventory/inventory_group.yml --become

# Gethering facts using adhoc command
# Fact variables
ansible db01 -m ansible.builtin.setup

ansible ec2servers -m  setup > ~/Desktop/facts.txt

# Run the ansible-playbook
ansible-playbook -i inventory/inventory_group.yml playbooks/install_apache_mysql.yml
ansible-playbook -i inventory/inventory_group.yml playbooks/install_apache_mysql.yml -v
ansible-playbook -i inventory/inventory_group.yml playbooks/install_apache_mysql.yml --vvvv

Check for documentation
https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html


# Check the syntax of ansible-playbook
ansible-playbook -i inventory/inventory_group.yml playbooks/install_apache_mysql.yml --syntax-check

# Dryrun  Checks of syntax execution before actually running the script ansible-playbook
ansible-playbook -i inventory/inventory_group.yml playbooks/install_apache_mysql.yml -C

# tAgs