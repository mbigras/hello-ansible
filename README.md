# hello-ansible

> Get up and running with Ansible.

## Getting started

The following procedure describes how to get up and running with Ansible for local development.

1. Gotcha: Depends on Desktop Linux and libvirt.

1. Start some virtual machines.

    ```
    make up
    ```

    This command creates a custom inventory and runs the _ping_ ad hoc command, just to check things are working.

1. Run a playbook.

    ```
    ansible-playbook ping.yaml
    ```

    This playbook runs the _ping_ module, again, just to check things are working.

    Your output should look like the following:

    ```
    $ ansible-playbook ping.yaml 

    PLAY [all] *********************************************************************

    TASK [Gathering Facts] *********************************************************
    ok: [node2]
    ok: [node1]

    TASK [Check connection] ********************************************************
    ok: [node1]
    ok: [node2]

    PLAY RECAP *********************************************************************
    node1                      : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    node2                      : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
    ```
