echo "hello?"
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS

ssh ubuntu@${DOCKER_HOST} \
   docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
ssh ubuntu@${DOCKER_HOST} \
   sudo mkdir -p ${SERVICE_DIR}
ssh ubuntu@${DOCKER_HOST} \
   sudo chown admin ${SERVICE_DIR}
scp docker-compose.yml.deploy \
    ubuntu@${DOCKER_HOST}:${SERVICE_DIR}/docker-compose.yml
ssh ubuntu@${DOCKER_HOST} \
    docker-compose -p g3cloudhub -f ${SERVICE_DIR}/docker-compose.yml up -d
