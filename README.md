
# Домашнее задание к занятию 3. «Введение. Экосистема. Архитектура. Жизненный цикл Docker-контейнера»

## Ответ №1
```
docker pull bosone/nginx:v1
```
## Ответ №2
```
- высоконагруженное монолитное Java веб-приложение - подходит использование физической машины, т.к. возможно наращивание мощности аппаратных ресурсов.
- Nodejs веб-приложение - подходит использование Docker-контейнеров, позволяет упаковать приложение вместе с его окружением и всеми зависимостями в контейнер.
- мобильное приложение c версиями для Android и iOS - подходит использование виртуальной машины, т.к. требуется масштабирование приложения и используется UI.
- шина данных на базе Apache Kafka - это распределённая потоковая платформа, повышенная пропустная способность, обработка данных в реальном времени, требуется использование физических машин.
- Elasticsearch-кластер для реализации логирования продуктивного веб-приложения — три ноды elasticsearch, два logstash и две ноды kibana - подходит использование выиртуальных машин, требуется масштабирование, сервис должен быть отказоустойчивым.
- мониторинг-стек на базе Prometheus и Grafana - подходит использование Docker, быстрое разыёртывание, масштабирование.
- MongoDB как основное хранилище данных для Java-приложения - подходит использование виртуальной машины или Docker-контейнеров, в зависимости от нагрузки сервиса.
- Gitlab-сервер для реализации CI/CD-процессов и приватный (закрытый) Docker Registry - подходит использование виртуальной машины и Docker-контейнеров, требуется масштабирование, управление нагрузкой.
 ```
## Ответ №3
```
 - docker run -it -v  /home/bosone/data:/Data centos:latest
```
```
 - docker run -it -v /home/bosone/data:/Data debian:stable-slim
```
```
docker ps
CONTAINER ID   IMAGE                COMMAND       CREATED          STATUS          PORTS     NAMES
fbece86ad8e6   debian:stable-slim   "bash"        12 seconds ago   Up 11 seconds             wonderful_babbage
ca91877f65b8   centos:latest        "/bin/bash"   44 seconds ago   Up 43 seconds             objective_pascal
```
```
docker exec -it fbece86ad8e6 bash
root@fbece86ad8e6:/# touch /Data/1.txt
```
```
touch /home/bosone/data/2.txt
```
```
docker exec -it ca91877f65b8 bash
[root@ca91877f65b8 /]# ls -la /Data/
total 8
drwxr-xr-x 2 root root 4096 Jul 16 12:49 .
drwxr-xr-x 1 root root 4096 Jul 16 12:23 ..
-rw-r--r-- 1 root root    0 Jul 16 12:47 1.txt
-rw-r--r-- 1 root root    0 Jul 16 12:49 2.txt
```
## Ответ №4
```
docker pull bosone/ansible:v2.15
```
