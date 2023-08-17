if docker-compose --context sausage-store ps back_blue | grep -q healthy; then
      docker-compose --context sausage-store up -d --wait --remove-orphans back_green && docker-compose --context sausage-store stop back_blue; 
      else docker-compose --context sausage-store up -d --wait --remove-orphans back_blue && docker-compose --context sausage-store stop back_green; fi