# Домашнее задание к занятию 3 «Использование Ansible»

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.
2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.
3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.

```ansible
- name: Install lighthouse
  hosts: lighthouse
  handlers:
    - name: Reload-nginx
      become: true
      ansible.builtin.command: nginx -s reload
      changed_when: false
  pre_tasks:
    - name: Lighthouse | Install dependencies
      become: true
      ansible.builtin.yum:
        name: git
        state: present
  tasks:
    - name: Lighthouse | Copy from git
      ansible.builtin.git:
        repo: "{{ lighthouse_vcs }}"
        version: master
        dest: "{{ lighthouse_location_dir }}"
    - name: Lighthouse | Create lighthouse config
      become: true
      ansible.builtin.template:
        src: templates/lighthouse.conf.j2
        dest: /etc/nginx/conf.d/default.conf
        mode: "0644"
      notify: Reload-nginx
```

4. Подготовьте свой inventory-файл `prod.yml`.
```
inventory-файл `prod` - динамический, создаётся по средствам `tarraform` с помощью шаблона hosts.tftpl
```
<p align="center">
  <img width="1200 height="600" src="/img/mnt-03-1.png">
</p>

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
<p align="center">
  <img width="1200 height="600" src="/img/mnt-03-2.png">
</p>

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
```ansible
/mnt-homeworks/08-ansible-03-yandex/playbook# ansible-playbook -i inventory/prod site.yml --check

PLAY [Install Clickhouse] **********************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [158.160.98.126]

TASK [Get clickhouse distrib] ******************************************************************************************************
ok: [158.160.98.126] => (item=clickhouse-client)
ok: [158.160.98.126] => (item=clickhouse-server)
ok: [158.160.98.126] => (item=clickhouse-common-static)

TASK [Install clickhouse packages] *************************************************************************************************
ok: [158.160.98.126] => (item=clickhouse-common-static-23.8.2.7.rpm)
ok: [158.160.98.126] => (item=clickhouse-client-23.8.2.7.rpm)
ok: [158.160.98.126] => (item=clickhouse-server-23.8.2.7.rpm)

TASK [Flush handlers] **************************************************************************************************************

TASK [Create database] *************************************************************************************************************
skipping: [158.160.98.126]

PLAY [Install Vector] **************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [51.250.77.133]

TASK [Get vector] ******************************************************************************************************************
ok: [51.250.77.133]

TASK [Install vector] **************************************************************************************************************
ok: [51.250.77.133]

TASK [Flush handlers to restart vector] ********************************************************************************************

TASK [Configure Vector | ensure what directory exists] *****************************************************************************
ok: [51.250.77.133]

TASK [Configure Vector | Template config] ******************************************************************************************
ok: [51.250.77.133]

PLAY [Install nginx] ***************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [158.160.99.131]

TASK [NGINX | Install epel-release] ************************************************************************************************
ok: [158.160.99.131]

TASK [NGINX | Install NGINX] *******************************************************************************************************
ok: [158.160.99.131]

TASK [NGINX | Create general config] ***********************************************************************************************
ok: [158.160.99.131]

PLAY [Install lighthouse] **********************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [158.160.99.131]

TASK [Lighthouse | Install dependencies] *******************************************************************************************
ok: [158.160.99.131]

TASK [Lighthouse | Copy from git] **************************************************************************************************
ok: [158.160.99.131]

TASK [Lighthouse | Create lighthouse config] ***************************************************************************************
ok: [158.160.99.131]

PLAY RECAP *************************************************************************************************************************
158.160.98.126             : ok=3    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
158.160.99.131             : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
51.250.77.133              : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
```ansible
/mnt-homeworks/08-ansible-03-yandex/playbook# ansible-playbook -i inventory/prod site.yml --diff -v
Using /etc/ansible/ansible.cfg as config file

PLAY [Install Clickhouse] **********************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [158.160.98.126]

TASK [Get clickhouse distrib] ******************************************************************************************************
ok: [158.160.98.126] => (item=clickhouse-client) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-client-23.8.2.7.rpm", "elapsed": 0, "gid": 0, "group": "root", "item": "clickhouse-client", "mode": "0644", "msg": "HTTP Error 304: Not Modified", "owner": "root", "secontext": "unconfined_u:object_r:admin_home_t:s0", "size": 97327, "state": "file", "status_code": 304, "uid": 0, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-client-23.8.2.7.x86_64.rpm"}
ok: [158.160.98.126] => (item=clickhouse-server) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-server-23.8.2.7.rpm", "elapsed": 0, "gid": 0, "group": "root", "item": "clickhouse-server", "mode": "0644", "msg": "HTTP Error 304: Not Modified", "owner": "root", "secontext": "unconfined_u:object_r:admin_home_t:s0", "size": 124215, "state": "file", "status_code": 304, "uid": 0, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-server-23.8.2.7.x86_64.rpm"}
ok: [158.160.98.126] => (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-23.8.2.7.rpm", "elapsed": 0, "gid": 0, "group": "root", "item": "clickhouse-common-static", "mode": "0644", "msg": "HTTP Error 304: Not Modified", "owner": "root", "secontext": "unconfined_u:object_r:admin_home_t:s0", "size": 282190472, "state": "file", "status_code": 304, "uid": 0, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-23.8.2.7.x86_64.rpm"}

TASK [Install clickhouse packages] *************************************************************************************************
ok: [158.160.98.126] => (item=clickhouse-common-static-23.8.2.7.rpm) => {"ansible_loop_var": "item", "changed": false, "item": "clickhouse-common-static-23.8.2.7.rpm", "msg": "", "rc": 0, "results": ["clickhouse-common-static-23.8.2.7-1.x86_64 providing ./clickhouse-common-static-23.8.2.7.rpm is already installed"]}
ok: [158.160.98.126] => (item=clickhouse-client-23.8.2.7.rpm) => {"ansible_loop_var": "item", "changed": false, "item": "clickhouse-client-23.8.2.7.rpm", "msg": "", "rc": 0, "results": ["clickhouse-client-23.8.2.7-1.x86_64 providing ./clickhouse-client-23.8.2.7.rpm is already installed"]}
ok: [158.160.98.126] => (item=clickhouse-server-23.8.2.7.rpm) => {"ansible_loop_var": "item", "changed": false, "item": "clickhouse-server-23.8.2.7.rpm", "msg": "", "rc": 0, "results": ["clickhouse-server-23.8.2.7-1.x86_64 providing ./clickhouse-server-23.8.2.7.rpm is already installed"]}

TASK [Flush handlers] **************************************************************************************************************

TASK [Create database] *************************************************************************************************************
ok: [158.160.98.126] => {"changed": false, "cmd": ["clickhouse-client", "-q", "create database logs;"], "delta": "0:00:00.114719", "end": "2023-09-16 12:26:13.753659", "failed_when_result": false, "msg": "non-zero return code", "rc": 82, "start": "2023-09-16 12:26:13.638940", "stderr": "Received exception from server (version 23.8.2):\nCode: 82. DB::Exception: Received from localhost:9000. DB::Exception: Database logs already exists.. (DATABASE_ALREADY_EXISTS)\n(query: create database logs;)", "stderr_lines": ["Received exception from server (version 23.8.2):", "Code: 82. DB::Exception: Received from localhost:9000. DB::Exception: Database logs already exists.. (DATABASE_ALREADY_EXISTS)", "(query: create database logs;)"], "stdout": "", "stdout_lines": []}

PLAY [Install Vector] **************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [51.250.77.133]

TASK [Get vector] ******************************************************************************************************************
ok: [51.250.77.133] => {"changed": false, "dest": "./vector-0.32.1.rpm", "elapsed": 0, "gid": 0, "group": "root", "mode": "0644", "msg": "HTTP Error 304: Not Modified", "owner": "root", "secontext": "unconfined_u:object_r:admin_home_t:s0", "size": 40590020, "state": "file", "status_code": 304, "uid": 0, "url": "https://packages.timber.io/vector/0.32.1/vector-0.32.1-1.x86_64.rpm"}

TASK [Install vector] **************************************************************************************************************
ok: [51.250.77.133] => {"changed": false, "msg": "", "rc": 0, "results": ["vector-0.32.1-1.x86_64 providing vector-0.32.1.rpm is already installed"]}

TASK [Flush handlers to restart vector] ********************************************************************************************

TASK [Configure Vector | ensure what directory exists] *****************************************************************************
ok: [51.250.77.133] => {"changed": false, "gid": 0, "group": "root", "mode": "0644", "owner": "root", "path": "/root/vector_config", "secontext": "unconfined_u:object_r:admin_home_t:s0", "size": 24, "state": "directory", "uid": 0}

TASK [Configure Vector | Template config] ******************************************************************************************
ok: [51.250.77.133] => {"changed": false, "checksum": "8c02cafe0e30bb0250c51b5f55ef80e93c5e556f", "dest": "/root/vector_config/vector.yml", "gid": 0, "group": "root", "mode": "0644", "owner": "root", "path": "/root/vector_config/vector.yml", "secontext": "system_u:object_r:admin_home_t:s0", "size": 65, "state": "file", "uid": 0}

PLAY [Install nginx] ***************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [158.160.99.131]

TASK [NGINX | Install epel-release] ************************************************************************************************
ok: [158.160.99.131] => {"changed": false, "msg": "", "rc": 0, "results": ["epel-release-7-11.noarch providing epel-release is already installed"]}

TASK [NGINX | Install NGINX] *******************************************************************************************************
ok: [158.160.99.131] => {"changed": false, "msg": "", "rc": 0, "results": ["1:nginx-1.20.1-10.el7.x86_64 providing nginx is already installed"]}

TASK [NGINX | Create general config] ***********************************************************************************************
ok: [158.160.99.131] => {"changed": false, "checksum": "c0c5834575ae8197d75ee8a09a11cf4d8ed364de", "dest": "/etc/nginx/nginx.conf", "gid": 0, "group": "root", "mode": "0644", "owner": "root", "path": "/etc/nginx/nginx.conf", "secontext": "system_u:object_r:httpd_config_t:s0", "size": 912, "state": "file", "uid": 0}

PLAY [Install lighthouse] **********************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [158.160.99.131]

TASK [Lighthouse | Install dependencies] *******************************************************************************************
ok: [158.160.99.131] => {"changed": false, "msg": "", "rc": 0, "results": ["git-1.8.3.1-25.el7_9.x86_64 providing git is already installed"]}

TASK [Lighthouse | Copy from git] **************************************************************************************************
ok: [158.160.99.131] => {"after": "d701335c25cd1bb9b5155711190bad8ab852c2ce", "before": "d701335c25cd1bb9b5155711190bad8ab852c2ce", "changed": false, "remote_url_changed": false}

TASK [Lighthouse | Create lighthouse config] ***************************************************************************************
ok: [158.160.99.131] => {"changed": false, "checksum": "0dfbaa2f43a0cf13ac9e5dd2ea49d48e3b4ccc4c", "dest": "/etc/nginx/conf.d/default.conf", "gid": 0, "group": "root", "mode": "0644", "owner": "root", "path": "/etc/nginx/conf.d/default.conf", "secontext": "system_u:object_r:httpd_config_t:s0", "size": 293, "state": "file", "uid": 0}

PLAY RECAP *************************************************************************************************************************
158.160.98.126             : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
158.160.99.131             : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
51.250.77.133              : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
```ansible
PLAY RECAP *************************************************************************************************************************
158.160.98.126             : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
158.160.99.131             : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
51.250.77.133              : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

9.  Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
```
***site.yml*** - состоит из:\
четырёх play - Install lighthouse, Install nginx, Install Clickhouse, Install Vector.\
***handlers*** - задачи по перезагрузке Clickhouse-server, Vector, Nginx. Вызываются через notify.\
***pre_tasks*** - претаска перед выполнением основной таски, в данном случае исползуется в play-установке lighthouse для устанвки git.\
***tasks*** - задачи выполняющися на хостах разделены на логические группы задач block/rescue:\
*ansible.builtin.get_url* - позволяет получить нужный дистрибутив в нужное расположение.\
*ansible.builtin.yum* - позволяет установить пакеты .rpm.\
*ansible.builtin.meta: flush_handlers* - запуск handler в середине инструкции.\
*ansible.builtin.command* - выполнение команд (в данном случае, подключение и создание db).\
*ansible.builtin.file* - директория для config-файла.\
*ansible.builtin.template* - путь к шаблону.
```


10.  Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.

---