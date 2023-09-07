# Домашнее задание к занятию 2 «Работа с Playbook»

1. Подготовьте свой inventory-файл `prod.yml`.
```ansible
clickhouse:
  hosts:
    clickhouse-01:
      ansible_host: localhost
vector:
  hosts: 
    vector-01:
      ansible_host: localhost
```

2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2.
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.
```ansible
- name: Install Vector
  hosts: vector
  handlers:
    - name: Restart vector service
      become: true
      ansible.builtin.service:
        name: vector.service
        state: restarted
  tasks:
    - name: Get vector deb
      become: true
      ansible.builtin.get_url:
        url: "https://packages.timber.io/vector/{{ vector_version }}/vector_{{ vector_version }}-1_amd64.deb"
        dest: "./vector_{{ vector_version }}-1_amd64.deb"
        mode: "0644"
    - name: Install vector deb
      become: true
      become_method: sudo
      ansible.builtin.apt:
      with_items:
          - vector_{{ vector_version }}-1_amd64.deb
      notify: Restart vector service
    - name: Flush handlers to restart vector
      ansible.builtin.meta: flush_handlers

    - name: Configure Vector | ensure what directory exists
      ansible.builtin.file:
        path: "{{ vector_config_dir }}"
        state: directory
        mode: "0644"
    - name: Configure Vector | Template config
      ansible.builtin.template:
        src: "templates/vector.yml.j2"
        mode: "0644"
        dest: "{{ vector_config_dir }}/vector.yml"
```

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
<p align="center">
  <img width="1200 height="600" src="/img/mnt-02-1.png">
</p>

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
<p align="center">
  <img width="1200 height="600" src="/img/mnt-02-2.png">
</p>
<p align="center">
  <img width="1200 height="600" src="/img/mnt-02-3.png">
</p>

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
<p align="center">
  <img width="1200 height="600" src="/img/mnt-02-4.png">
</p>
<p align="center">
  <img width="1200 height="600" src="/img/mnt-02-5.png">
</p>
<p align="center">
  <img width="1200 height="600" src="/img/mnt-02-6.png">
</p>

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
<p align="center">
  <img width="1200 height="600" src="/img/mnt-02-7.png">
</p>

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook).\
***site.yml*** - состоит из:\
двух play - Install Clickhouse и Install Vector.\
***handlers*** - одна задача по перезагрузке Clickhouse-server, другая по перезагрузке vector. Вызывается один раз, в конце, через notify.\
***tasks*** - задачи выполняющися на хостах разделены на логические группы задач block/rescue:\
*ansible.builtin.get_url* - позволяет получить нужный дистрибутив в нужное расположение.\
*ansible.builtin.apt* - позволяет установить пакеты .deb.\
*ansible.builtin.meta: flush_handlers* - запуск handler в середине инструкции.\
*ansible.builtin.command* - выполнение комманд (в данном случае, подключение и создание db)\
*ansible.builtin.file* - директория для vector config.\
*ansible.builtin.template* - путь к шаблону.\

*become: true* - повышение привилегий для запуска задачи.\
*become_method: sudo* - используемый метод повышения привилегий.\

10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

---