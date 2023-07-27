# Домашнее задание к занятию «Введение в Terraform»

### Чеклист готовности к домашнему заданию

1. Скачайте и установите актуальную версию **terraform** >=1.4.X . Приложите скриншот вывода команды terraform --version.
<p align="center">
  <img width="1200" height="600" src="/img/hw-01.png">
</p>
------

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте.
2. Изучите файл **.gitignore**. В каком terraform файле согласно этому .gitignore допустимо сохранить личную, секретную информацию?

 > personal.auto.tfvars

3. Выполните код проекта. Найдите  в State-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.

 > "result": "OImGgw8PDWu7NRRu"

4. Раскомментируйте блок кода, примерно расположенный на строчках 29-42 файла **main.tf**.
Выполните команду terraform validate. Объясните в чем заключаются намеренно допущенные ошибки? Исправьте их.

 > on main.tf line 28, in resource "docker_container" "1nginx": - Имя должно начинаться с буквы или символа подчеркивания и может содержать только буквы, цифры, символы подчеркивания и дефисы. 
 > on main.tf line 23, in resource "docker_image": - Все блоки ресурсов должны иметь 2 метки (тип, имя).
 > on main.tf line 30, in resource "docker_container" "nginx":
 > 	30:   name  = "example_${random_password.random_string_FAKE.resulT}" - Управляемый ресурс «random_password» «random_string_FAKE» не был объявлен в корневом модуле.

5. Выполните код. В качестве ответа приложите вывод команды ```docker ps```

```bash
root@devnet:~/ter-homeworks/01/src# docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
cd095bc471ee   021283c8eb95   "/docker-entrypoint.…"   40 seconds ago   Up 39 seconds   0.0.0.0:8000->80/tcp   example_OImGgw8PDWu7NRRu
root@devnet:~/ter-homeworks/01/src# 
```
6. Замените имя docker-контейнера в блоке кода на hello_world, выполните команду terraform apply -auto-approve.
Объясните своими словами, в чем может быть опасность применения ключа -auto-approve? В качестве ответа дополнительно приложите вывод команды docker ps.

 > terraform apply -auto-approve - Применение нового плана конфигурации без запроса подтверждения, риск непредсказуемых изменений конфигурации. 
```bash
root@devnet:~/ter-homeworks/01/src# docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

8. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**. 

```terraform
{
  "version": 4,
  "terraform_version": "1.5.2",
  "serial": 22,
  "lineage": "00d1ffe6-a1c5-daff-24f8-4e4df3a83b73",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "docker_image",
      "name": "nginx",
      "provider": "provider[\"registry.terraform.io/kreuzwerker/docker\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "build": [],
            "force_remove": null,
            "id": "sha256:021283c8eb95be02b23db0de7f609d603553c6714785e7a673c6594a624ffbdanginx:latest",
            "image_id": "sha256:021283c8eb95be02b23db0de7f609d603553c6714785e7a673c6594a624ffbda",
            "keep_locally": true,
            "name": "nginx:latest",
            "platform": null,
            "pull_triggers": null,
            "repo_digest": "nginx@sha256:08bc36ad52474e528cc1ea3426b5e3f4bad8a130318e3140d6cfe29c8892c7ef",
            "triggers": null
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "random_password",
      "name": "random_string",
      "provider": "provider[\"registry.terraform.io/hashicorp/random\"]",
      "instances": [
        {
          "schema_version": 3,
          "attributes": {
            "bcrypt_hash": "$2a$10$MqQ.EuHwgCRHBAhrUAssE.HkuPLXOE0qvNqp15RGetGLryZ6zk1ru",
            "id": "none",
            "keepers": null,
            "length": 16,
            "lower": true,
            "min_lower": 1,
            "min_numeric": 1,
            "min_special": 0,
            "min_upper": 1,
            "number": true,
            "numeric": true,
            "override_special": null,
            "result": "Q4mZIsPyc6PAl8xG",
            "special": false,
            "upper": true
          },
          "sensitive_attributes": []
        }
      ]
    }
  ],
  "check_results": null
}
```
9. Объясните, почему при этом не был удален docker образ **nginx:latest** ? Ответ подкрепите выдержкой из документации провайдера.
```
Образы Docker имеют промежуточные уровни, которые повышают возможность повторного использования.
```
------


### Задание 2*

1. Изучите в документации provider [**Virtualbox**](https://docs.comcloud.xyz/providers/shekeriev/virtualbox/latest/docs) от 
shekeriev.
2. Создайте с его помощью любую виртуальную машину. Чтобы не использовать VPN советуем выбрать любой образ с расположением в github из [**списка**](https://www.vagrantbox.es/)

В качестве ответа приложите plan для создаваемого ресурса и скриншот созданного в VB ресурса. 
```terraform
sudo terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # virtualbox_vm.vm1 will be created
  + resource "virtualbox_vm" "vm1" {
      + cpus      = 1
      + id        = (known after apply)
      + image     = "https://app.vagrantup.com/shekeriev/boxes/debian-11/versions/0.2/providers/virtualbox.box"
      + memory    = "512 mib"
      + name      = "debian-111"
      + status    = "running"
      + user_data = jsonencode(
            {
              + foo  = "bar"
              + role = "worker"
            }
        )

      + network_adapter {
          + device                 = "IntelPro1000MTDesktop"
          + host_interface         = "vboxnet0"
          + ipv4_address           = (known after apply)
          + ipv4_address_available = (known after apply)
          + mac_address            = (known after apply)
          + status                 = (known after apply)
          + type                   = "hostonly"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + IPAddress = (known after apply)

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run
"terraform apply" now.

```
**Созданный VB ресурс** 
<p align="center">
  <img width="1200" height="600" src="/img/hw-02.png">
</p>
<p align="center">
  <img width="1200" height="600" src="/img/hw-03.png">
</p>
<p align="center">
  <img width="1200" height="600" src="/img/hw-04.png">
</p>
