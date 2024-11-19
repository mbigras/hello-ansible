#!/usr/bin/env bash
# Script vagrant-up.sh starts machines and creates inventory.

vagrant up

# Create inventory with local Ansible settings.
echo "" >vagrant_hosts
for node in node1 node2
do
	printf '%s ansible_ssh_private_key_file=.vagrant/machines/%s/libvirt/private_key ansible_host=%s ansible_python_interpreter=/usr/bin/python3 ansible_user=vagrant ansible_python_interpreter=/usr/bin/python3 ansible_ssh_extra_args="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"\n' \
		$node \
		$node \
		$(vagrant ssh $node -c 'ip address show eth0' | awk '$1 == "inet" { sub("/24", "", $2); print $2 }') | tee -a vagrant_hosts
done

# Check things are working.
ansible -m ping all
