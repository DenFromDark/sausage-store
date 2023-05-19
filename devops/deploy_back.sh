#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
#Перезаливаем дескриптор сервиса на ВМ для деплоя
sudo cp -rf sausage-store-backend.service /etc/systemd/system/sausage-store-backend.service && \
sudo cp /home/${DEV_USER}/sausage-store-backend.env /home/jarservice/sausage-store-backend.env && \
sudo chown jarservice:jarservice /home/jarservice/sausage-store-backend.env && \
sudo chmod 400 /home/jarservice/sausage-store-backend.env && \
sudo rm -f /home/jarservice/sausage-store.jar||true && \
#Переносим артефакт в нужную папку
sudo curl -k -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store-${VERSION}.jar ${NEXUS_REPO_URL}sausage-store-ponizovskiy-denis-backend/com/yandex/practicum/devops/sausage-store/${VERSION}/sausage-store-${VERSION}.jar && \
sudo cp ./sausage-store-${VERSION}.jar /home/jarservice/sausage-store.jar||true && \
#"<...>||true" говорит, если команда обвалится — продолжай#Обновляем конфиг systemd с помощью рестарта
#sudo chown jarservice:jarservice /home/jarservice/sausage-store.jar && \

sudo systemctl daemon-reload && \

#Перезапускаем сервис сосисочной
sudo systemctl restart sausage-store-backend