#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
#Перезаливаем дескриптор сервиса на ВМ для деплоя
sudo sh -c 'cp -rf sausage-store-backend.service /etc/systemd/system/sausage-store-backend.service; \
    rm -f /home/jarservice/sausage-store.jar||true; \

    curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o /home/${DEV_USER}/sausage-store-${VERSION}.jar \
        ${NEXUS_REPO_URL}sausage-store-ponizovskiy-denis-backend/com/yandex/practicum/devops/sausage-store/${VERSION}/sausage-store-${VERSION}.jar; \

    cp ./sausage-store.jar /home/jarservice/sausage-store.jar; \

    systemctl daemon-reload; \
    
    systemctl restart sausage-store-backend'