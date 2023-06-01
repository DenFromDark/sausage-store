# #! /bin/bash
# #Если свалится одна из команд, рухнет и весь скрипт
# set -xe
# #Перезаливаем дескриптор сервиса на ВМ для деплоя
# sudo cp -rf sausage-store-frontend.service /etc/systemd/system/sausage-store-frontend.service && \
# #sudo rm -f /home/jarservice/sausage-store.jar||true
# #Переносим артефакт в нужную папку
# sudo curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o /home/${DEV_USER}/sausage-store-${VERSION}.tar.gz ${NEXUS_REPO_URL}sausage-store-ponizovskiy-denis-frontend/sausage-store/${VERSION}/sausage-store-${VERSION}.tar.gz && \
# sudo mkdir /var/www-data/${VERSION} && \
# sudo tar -C /var/www-data/${VERSION} -xvf /home/${DEV_USER}/sausage-store-${VERSION}.tar.gz && \
# sudo cp -r /var/www-data/${VERSION}/frontend/* /var/www-data/ && \
# #rm -f /var/www-data/${VERSION}
# #sudo cp ./sausage-store.jar /home/jarservice/sausage-store.jar||true #"<...>||true" говорит, если команда обвалится — продолжай#Обновляем конфиг systemd с помощью рестарта
# sudo systemctl daemon-reload && \
# 
# #Перезапускаем сервис сосисочной
# sudo systemctl restart sausage-store-frontend

#!/bin/bash
set +e

docker pull gitlab.praktikum-services.ru:5050/d.ponizovskiy/sausage-store/sausage-frontend:latest
docker stop frontend || true
docker rm frontend || true
set -e
docker run -d --name frontend \
    --network=sausage_network \
    --restart always \
    --pull always \
    gitlab.praktikum-services.ru:5050/d.ponizovskiy/sausage-store/sausage-frontend:latest 