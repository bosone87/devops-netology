# Домашнее задание к занятию 5 «Тестирование roles»

## Подготовка к выполнению

1. Установите molecule: `pip3 install "molecule==3.5.2"` и драйвера `pip3 install molecule_docker molecule_podman`.
2. Выполните `docker pull aragast/netology:latest` —  это образ с podman, tox и несколькими пайтонами (3.7 и 3.9) внутри.

## Основная часть

Ваша цель — настроить тестирование ваших ролей.

Задача — сделать сценарии тестирования для vector.

Ожидаемый результат — все сценарии успешно проходят тестирование ролей.

### Molecule

1. Запустите  `molecule test -s centos_7` внутри корневой директории clickhouse-role, посмотрите на вывод команды. Данная команда может отработать с ошибками, это нормально. Наша цель - посмотреть как другие в реальном мире используют молекулу.
```ansible
/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse# molecule test -s centos_7
INFO     centos_7 scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/7e099f/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/7e099f/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/7e099f/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > lint
COMMAND: yamllint .
ansible-lint
flake8

Traceback (most recent call last):
  File "/usr/local/bin/ansible-lint", line 8, in <module>
    sys.exit(_run_cli_entrypoint())
             ^^^^^^^^^^^^^^^^^^^^^
  File "/root/.local/lib/python3.11/site-packages/ansiblelint/__main__.py", line 327, in _run_cli_entrypoint
    sys.exit(main(sys.argv))
             ^^^^^^^^^^^^^^
  File "/root/.local/lib/python3.11/site-packages/ansiblelint/__main__.py", line 213, in main
    initialize_options(argv[1:])
  File "/root/.local/lib/python3.11/site-packages/ansiblelint/__main__.py", line 132, in initialize_options
    options.cache_dir.mkdir(parents=True, exist_ok=True)
    ^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'str' object has no attribute 'mkdir'
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
ok: [localhost] => (item=centos_7)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > syntax

playbook: /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks/converge.yml
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Create Dockerfiles from image names] *************************************
changed: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'diff': [], 'dest': '/root/.cache/molecule/clickhouse/centos_7/Dockerfile_centos_7', 'src': '/root/.ansible/tmp/ansible-tmp-1695493743.7022984-72802-42245160091392/source', 'md5sum': 'e90d08cd34f49a5f8a41a07de1348618', 'checksum': '4b70768619482424811f2977aa277a5acf2b13a1', 'changed': True, 'uid': 0, 'gid': 0, 'owner': 'root', 'group': 'root', 'mode': '0600', 'state': 'file', 'size': 2199, 'invocation': {'module_args': {'src': '/root/.ansible/tmp/ansible-tmp-1695493743.7022984-72802-42245160091392/source', 'dest': '/root/.cache/molecule/clickhouse/centos_7/Dockerfile_centos_7', 'mode': '0600', 'follow': False, '_original_basename': 'Dockerfile.j2', 'checksum': '4b70768619482424811f2977aa277a5acf2b13a1', 'backup': False, 'force': True, 'unsafe_writes': False, 'content': None, 'validate': None, 'directory_mode': None, 'remote_src': None, 'local_follow': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': {'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
ok: [localhost] => (item=molecule_local/centos:7)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '642059477198.72966', 'results_file': '/root/.ansible_async/642059477198.72966', 'changed': True, 'failed': False, 'item': {'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=7    changed=3    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos_7]

TASK [Apply Clickhouse Role] ***************************************************
ERROR! the role 'ansible-clickhouse' was not found in /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks/roles:/root/.cache/molecule/clickhouse/centos_7/roles:/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles:/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse:/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks

The error appears to be in '/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks/converge.yml': line 7, column 15, but may
be elsewhere in the file depending on the exact syntax problem.

The offending line appears to be:

      include_role:
        name: ansible-clickhouse
              ^ here

PLAY RECAP *********************************************************************
centos_7                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '-D', '--inventory', '/root/.cache/molecule/clickhouse/centos_7/inventory', '--skip-tags', 'molecule-notest,notest', '/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks/converge.yml']
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=centos_7)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
root@devnet:/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse# molecule test -s centos_7
INFO     centos_7 scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/7e099f/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/7e099f/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/7e099f/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > lint
COMMAND: yamllint .
ansible-lint
flake8

Traceback (most recent call last):
  File "/usr/local/bin/ansible-lint", line 8, in <module>
    sys.exit(_run_cli_entrypoint())
             ^^^^^^^^^^^^^^^^^^^^^
  File "/root/.local/lib/python3.11/site-packages/ansiblelint/__main__.py", line 327, in _run_cli_entrypoint
    sys.exit(main(sys.argv))
             ^^^^^^^^^^^^^^
  File "/root/.local/lib/python3.11/site-packages/ansiblelint/__main__.py", line 213, in main
    initialize_options(argv[1:])
  File "/root/.local/lib/python3.11/site-packages/ansiblelint/__main__.py", line 132, in initialize_options
    options.cache_dir.mkdir(parents=True, exist_ok=True)
    ^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'str' object has no attribute 'mkdir'
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
ok: [localhost] => (item=centos_7)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > syntax

playbook: /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks/converge.yml
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Create Dockerfiles from image names] *************************************
changed: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'diff': [], 'dest': '/root/.cache/molecule/clickhouse/centos_7/Dockerfile_centos_7', 'src': '/root/.ansible/tmp/ansible-tmp-1695493878.9092362-73940-24902612718566/source', 'md5sum': 'e90d08cd34f49a5f8a41a07de1348618', 'checksum': '4b70768619482424811f2977aa277a5acf2b13a1', 'changed': True, 'uid': 0, 'gid': 0, 'owner': 'root', 'group': 'root', 'mode': '0600', 'state': 'file', 'size': 2199, 'invocation': {'module_args': {'src': '/root/.ansible/tmp/ansible-tmp-1695493878.9092362-73940-24902612718566/source', 'dest': '/root/.cache/molecule/clickhouse/centos_7/Dockerfile_centos_7', 'mode': '0600', 'follow': False, '_original_basename': 'Dockerfile.j2', 'checksum': '4b70768619482424811f2977aa277a5acf2b13a1', 'backup': False, 'force': True, 'unsafe_writes': False, 'content': None, 'validate': None, 'directory_mode': None, 'remote_src': None, 'local_follow': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': {'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
ok: [localhost] => (item=molecule_local/centos:7)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '688430744215.74115', 'results_file': '/root/.ansible_async/688430744215.74115', 'changed': True, 'failed': False, 'item': {'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=7    changed=3    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos_7]

TASK [Apply Clickhouse Role] ***************************************************
ERROR! the role 'ansible-clickhouse' was not found in /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks/roles:/root/.cache/molecule/clickhouse/centos_7/roles:/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles:/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse:/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks

The error appears to be in '/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks/converge.yml': line 7, column 15, but may
be elsewhere in the file depending on the exact syntax problem.

The offending line appears to be:

      include_role:
        name: ansible-clickhouse
              ^ here

PLAY RECAP *********************************************************************
centos_7                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '-D', '--inventory', '/root/.cache/molecule/clickhouse/centos_7/inventory', '--skip-tags', 'molecule-notest,notest', '/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks/converge.yml']
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=centos_7)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
```

2. Перейдите в каталог с ролью vector-role и создайте сценарий тестирования по умолчанию при помощи `molecule init scenario --driver-name docker`.
3. Добавьте несколько разных дистрибутивов (centos:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.
```ansible
root@devnet:/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/vector# molecule test 
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/b0d51c/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/b0d51c/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/b0d51c/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > lint
INFO     Lint is disabled.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=centos8)
ok: [localhost] => (item=ubuntu)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/vector/molecule/default/converge.yml
INFO     Running default > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost] => (item=None) 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}) 

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/centos:8) 
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/ubuntu:latest) 

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '239367816876.333749', 'results_file': '/root/.ansible_async/239367816876.333749', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '117652775842.333775', 'results_file': '/root/.ansible_async/117652775842.333775', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu]
ok: [centos8]

TASK [Include vector-role] *****************************************************

TASK [vector : Appstream1] *****************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Appstream2] *****************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Get vector] *****************************************************
skipping: [ubuntu]
changed: [centos8]

TASK [vector : Install vector] *************************************************
skipping: [ubuntu]
changed: [centos8]

TASK [vector : Flush handlers to restart vector] *******************************
[WARNING]: flush_handlers task does not support when conditional

TASK [vector : Configure Vector | ensure what directory exists] ****************
skipping: [ubuntu]
changed: [centos8]

TASK [vector : Configure Vector | Template config] *****************************
skipping: [ubuntu]
changed: [centos8]

TASK [vector : Get vector] *****************************************************
skipping: [centos8]
changed: [ubuntu]

TASK [vector : Install vector] *************************************************
skipping: [centos8] => (item=vector_0.32.1-1_amd64.deb) 
changed: [ubuntu] => (item=vector_0.32.1-1_amd64.deb)

TASK [vector : Flush handlers to restart vector] *******************************

TASK [vector : Configure Vector | ensure what directory exists] ****************
skipping: [centos8]
changed: [ubuntu]

TASK [vector : Configure Vector | Template config] *****************************
skipping: [centos8]
changed: [ubuntu]

PLAY RECAP *********************************************************************
centos8                    : ok=7    changed=4    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0
ubuntu                     : ok=5    changed=4    unreachable=0    failed=0    skipped=6    rescued=0    ignored=0

INFO     Running default > idempotence

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu]
ok: [centos8]

TASK [Include vector-role] *****************************************************

TASK [vector : Appstream1] *****************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Appstream2] *****************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Get vector] *****************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Install vector] *************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Flush handlers to restart vector] *******************************
[WARNING]: flush_handlers task does not support when conditional

TASK [vector : Configure Vector | ensure what directory exists] ****************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Configure Vector | Template config] *****************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Get vector] *****************************************************
skipping: [centos8]
ok: [ubuntu]

TASK [vector : Install vector] *************************************************
skipping: [centos8] => (item=vector_0.32.1-1_amd64.deb) 
ok: [ubuntu] => (item=vector_0.32.1-1_amd64.deb)

TASK [vector : Flush handlers to restart vector] *******************************

TASK [vector : Configure Vector | ensure what directory exists] ****************
skipping: [centos8]
ok: [ubuntu]

TASK [vector : Configure Vector | Template config] *****************************
skipping: [centos8]
ok: [ubuntu]

PLAY RECAP *********************************************************************
centos8                    : ok=7    changed=0    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0
ubuntu                     : ok=5    changed=0    unreachable=0    failed=0    skipped=6    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier

PLAY [Verify] ******************************************************************

TASK [Example assertion] *******************************************************
ok: [centos8] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [ubuntu] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *********************************************************************
centos8                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
```

4. Добавьте несколько assert в verify.yml-файл для  проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска и др.).
```yml
- name: Verify
  hosts: all
  gather_facts: true
  vars:
    vector_config_path: /etc/vector/vector.yaml
  tasks:
    - name: Get Vector version
      ansible.builtin.command: "vector --version"
      changed_when: false
      register: vector_version
    - name: Assert Vector instalation
      ansible.builtin.assert:
        that: "'{{ vector_version.rc }}' == '0'"
    - name: Validation Vector configuration
      ansible.builtin.raw: "vector validate --no-environment --config-yaml {{ vector_config_path }}"
      changed_when: false
      register: vector_validate
```

5. Запустите тестирование роли повторно и проверьте, что оно прошло успешно.
```ansible
root@devnet:/home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/vector# molecule test 
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/b0d51c/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/b0d51c/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/b0d51c/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > lint
INFO     Lint is disabled.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=centos8)
ok: [localhost] => (item=ubuntu)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /home/bosone/mnt-homeworks/08-ansible-05-testing/playbook/roles/vector/molecule/default/converge.yml
INFO     Running default > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost] => (item=None) 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}) 

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/centos:8) 
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/ubuntu:latest) 

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '912350388951.339044', 'results_file': '/root/.ansible_async/912350388951.339044', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:8', 'name': 'centos8', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '676134476693.339070', 'results_file': '/root/.ansible_async/676134476693.339070', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos8]
ok: [ubuntu]

TASK [Include vector-role] *****************************************************

TASK [vector : Appstream1] *****************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Appstream2] *****************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Get vector] *****************************************************
skipping: [ubuntu]
changed: [centos8]

TASK [vector : Install vector] *************************************************
skipping: [ubuntu]
changed: [centos8]

TASK [vector : Flush handlers to restart vector] *******************************
[WARNING]: flush_handlers task does not support when conditional

TASK [vector : Configure Vector | ensure what directory exists] ****************
skipping: [ubuntu]
changed: [centos8]

TASK [vector : Configure Vector | Template config] *****************************
skipping: [ubuntu]
changed: [centos8]

TASK [vector : Get vector] *****************************************************
skipping: [centos8]
changed: [ubuntu]

TASK [vector : Install vector] *************************************************
skipping: [centos8] => (item=vector_0.32.1-1_amd64.deb) 
changed: [ubuntu] => (item=vector_0.32.1-1_amd64.deb)

TASK [vector : Flush handlers to restart vector] *******************************

TASK [vector : Configure Vector | ensure what directory exists] ****************
skipping: [centos8]
changed: [ubuntu]

TASK [vector : Configure Vector | Template config] *****************************
skipping: [centos8]
changed: [ubuntu]

PLAY RECAP *********************************************************************
centos8                    : ok=7    changed=4    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0
ubuntu                     : ok=5    changed=4    unreachable=0    failed=0    skipped=6    rescued=0    ignored=0

INFO     Running default > idempotence

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos8]
ok: [ubuntu]

TASK [Include vector-role] *****************************************************

TASK [vector : Appstream1] *****************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Appstream2] *****************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Get vector] *****************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Install vector] *************************************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Flush handlers to restart vector] *******************************
[WARNING]: flush_handlers task does not support when conditional

TASK [vector : Configure Vector | ensure what directory exists] ****************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Configure Vector | Template config] *****************************
skipping: [ubuntu]
ok: [centos8]

TASK [vector : Get vector] *****************************************************
skipping: [centos8]
ok: [ubuntu]

TASK [vector : Install vector] *************************************************
skipping: [centos8] => (item=vector_0.32.1-1_amd64.deb) 
ok: [ubuntu] => (item=vector_0.32.1-1_amd64.deb)

TASK [vector : Flush handlers to restart vector] *******************************

TASK [vector : Configure Vector | ensure what directory exists] ****************
skipping: [centos8]
ok: [ubuntu]

TASK [vector : Configure Vector | Template config] *****************************
skipping: [centos8]
ok: [ubuntu]

PLAY RECAP *********************************************************************
centos8                    : ok=7    changed=0    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0
ubuntu                     : ok=5    changed=0    unreachable=0    failed=0    skipped=6    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier

PLAY [Verify] ******************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos8]
ok: [ubuntu]

TASK [Get Vector version] ******************************************************
ok: [ubuntu]
ok: [centos8]

TASK [Assert Vector instalation] ***********************************************
ok: [centos8] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [ubuntu] => {
    "changed": false,
    "msg": "All assertions passed"
}

TASK [Validation Vector configuration] *****************************************
ok: [centos8]
ok: [ubuntu]

PLAY RECAP *********************************************************************
centos8                    : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item=centos8)
changed: [localhost] => (item=ubuntu)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
```

6. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

### Tox

1. Добавьте в директорию с vector-role файлы из [директории](./example).
2. Запустите `docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash`, где path_to_repo — путь до корня репозитория с vector-role на вашей файловой системе.
3. Внутри контейнера выполните команду `tox`, посмотрите на вывод.
5. Создайте облегчённый сценарий для `molecule` с драйвером `molecule_podman`. Проверьте его на исполнимость.
6. Пропишите правильную команду в `tox.ini`, чтобы запускался облегчённый сценарий.
8. Запустите команду `tox`. Убедитесь, что всё отработало успешно.
9. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.
```ansible
[root@138ed166faab vector-role]# tox
py37-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==1.0.0,ansible-lint==5.1.3,arrow==1.2.3,bcrypt==4.0.1,binaryornot==0.4.4,bracex==2.3.post1,cached-property==1.5.2,Cerberus==1.3.5,certifi==2023.7.22,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.2.0,click==8.1.7,click-help-colors==0.9.2,cookiecutter==2.3.1,cryptography==41.0.4,distro==1.8.0,enrich==1.2.7,idna==3.4,importlib-metadata==6.7.0,Jinja2==3.1.2,jmespath==1.0.1,lxml==4.9.3,markdown-it-py==2.2.0,MarkupSafe==2.1.3,mdurl==0.1.2,molecule==3.5.2,molecule-podman==1.1.0,packaging==23.1,paramiko==2.12.0,pathspec==0.11.2,pluggy==1.2.0,pycparser==2.21,Pygments==2.16.1,PyNaCl==1.5.0,python-dateutil==2.8.2,python-slugify==8.0.1,PyYAML==5.4.1,requests==2.31.0,rich==13.5.3,ruamel.yaml==0.17.32,ruamel.yaml.clib==0.2.7,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.2.3,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.5,wcmatch==8.4.1,yamllint==1.26.3,zipp==3.15.0
py37-ansible210 run-test-pre: PYTHONHASHSEED='3806544882'
py37-ansible210 run-test: commands[0] | molecule test -s tox --destroy always
INFO     tox scenario test matrix: destroy, create, converge, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/b984a4/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/b984a4/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/b984a4/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running tox > destroy
INFO     Sanity checks: 'podman'

PLAY [Destroy] *****************************************************************

TASK [Populate instance config] ************************************************
ok: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running tox > create

PLAY [Create] ******************************************************************

TASK [Populate instance config dict] *******************************************
skipping: [localhost]

TASK [Convert instance config dict to a list] **********************************
skipping: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=0    changed=0    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0

INFO     Running tox > converge

PLAY [Converge] ****************************************************************

TASK [Replace this task with one that validates your content] ******************
ok: [instance] => {
    "msg": "This is the effective test"
}

PLAY RECAP *********************************************************************
instance                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > destroy

PLAY [Destroy] *****************************************************************

TASK [Populate instance config] ************************************************
ok: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
py37-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==1.0.0,ansible-lint==5.1.3,arrow==1.2.3,bcrypt==4.0.1,binaryornot==0.4.4,bracex==2.3.post1,cached-property==1.5.2,Cerberus==1.3.5,certifi==2023.7.22,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.2.0,click==8.1.7,click-help-colors==0.9.2,cookiecutter==2.3.1,cryptography==41.0.4,distro==1.8.0,enrich==1.2.7,idna==3.4,importlib-metadata==6.7.0,Jinja2==3.1.2,jmespath==1.0.1,lxml==4.9.3,markdown-it-py==2.2.0,MarkupSafe==2.1.3,mdurl==0.1.2,molecule==3.5.2,molecule-podman==1.1.0,packaging==23.1,paramiko==2.12.0,pathspec==0.11.2,pluggy==1.2.0,pycparser==2.21,Pygments==2.16.1,PyNaCl==1.5.0,python-dateutil==2.8.2,python-slugify==8.0.1,PyYAML==5.4.1,requests==2.31.0,rich==13.5.3,ruamel.yaml==0.17.32,ruamel.yaml.clib==0.2.7,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.2.3,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.5,wcmatch==8.4.1,yamllint==1.26.3,zipp==3.15.0
py37-ansible30 run-test-pre: PYTHONHASHSEED='3806544882'
py37-ansible30 run-test: commands[0] | molecule test -s tox --destroy always
INFO     tox scenario test matrix: destroy, create, converge, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/b984a4/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/b984a4/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/b984a4/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running tox > destroy
INFO     Sanity checks: 'podman'

PLAY [Destroy] *****************************************************************

TASK [Populate instance config] ************************************************
ok: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running tox > create

PLAY [Create] ******************************************************************

TASK [Populate instance config dict] *******************************************
skipping: [localhost]

TASK [Convert instance config dict to a list] **********************************
skipping: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=0    changed=0    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0

INFO     Running tox > converge

PLAY [Converge] ****************************************************************

TASK [Replace this task with one that validates your content] ******************
ok: [instance] => {
    "msg": "This is the effective test"
}

PLAY RECAP *********************************************************************
instance                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > destroy

PLAY [Destroy] *****************************************************************

TASK [Populate instance config] ************************************************
ok: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
__________________________________________________________ summary ___________________________________________________________
  py37-ansible210: commands succeeded
  py37-ansible30: commands succeeded
  congratulations :)
```

После выполнения у вас должно получится два сценария molecule и один tox.ini файл в репозитории. Не забудьте указать в ответе теги решений Tox и Molecule заданий. В качестве решения пришлите ссылку на  ваш репозиторий и скриншоты этапов выполнения задания.