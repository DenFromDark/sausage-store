# #! /bin/bash
# #Если свалится одна из команд, рухнет и весь скрипт
# set -xe
# #Перезаливаем дескриптор сервиса на ВМ для деплоя
# sudo cp -rf sausage-store-backend.service /etc/systemd/system/sausage-store-backend.service && \
# sudo cp /home/${DEV_USER}/sausage-store-backend.env /home/jarservice/sausage-store-backend.env && \
# sudo chown jarservice:jarservice /home/jarservice/sausage-store-backend.env && \
# sudo chmod 400 /home/jarservice/sausage-store-backend.env && \
# sudo rm -f /home/jarservice/sausage-store.jar||true && \
# #Переносим артефакт в нужную папку
# sudo curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store-${VERSION}.jar ${NEXUS_REPO_URL}sausage-store-ponizovskiy-denis-backend/com/yandex/practicum/devops/sausage-store/${VERSION}/sausage-store-${VERSION}.jar && \
# sudo cp ./sausage-store-${VERSION}.jar /home/jarservice/sausage-store.jar||true && \
# #"<...>||true" говорит, если команда обвалится — продолжай#Обновляем конфиг systemd с помощью рестарта
# 
# sudo systemctl daemon-reload && \
# 
# #Перезапускаем сервис сосисочной
# sudo systemctl restart sausage-store-backend

#!/bin/bash
set +e
cat > .env <<EOF
SPRING_DATASOURCE_URL=${SPRING_DATASOURCE_URL}
SPRING_DATASOURCE_USERNAME=${SPRING_DATASOURCE_USERNAME}
SPRING_DATASOURCE_PASSWORD=${SPRING_DATASOURCE_PASSWORD}
SPRING_DATA_MONGODB_URI=${SPRING_DATA_MONGODB_URI}
REPORT_PATH=/tmp
EOF


docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD $REGISTRY
docker network create -d bridge sausage_network || true
docker pull gitlab.praktikum-services.ru:5050/d.ponizovskiy/sausage-store/sausage-backend:latest
docker stop backend || true
docker rm backend || true
set -e
docker run -d --name backend \
    --network=sausage_network \
    --restart always \
    --pull always \
    --env-file .env \
    gitlab.praktikum-services.ru:5050/d.ponizovskiy/sausage-store/sausage-backend:latest 
