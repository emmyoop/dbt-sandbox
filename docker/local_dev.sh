#!/bin/zsh

helpFunction()
{
   echo ""
   echo "Usage: $0 -d database -p project"
   echo -e "\t-d Database to spin up, if any."
   echo -e "\tValid arguments: oracle postgres"
   echo -e "\t-p Project name, defaults to local_dev."
   exit 1 # Exit script after printing help
}

#cleanup() {
#    echo "Cleaning up..."
#    docker compose -p local_dev down
#    exit
#}
#
#trap cleanup INT TERM

while getopts d: flag
do
    case "${flag}" in
        d) database=${OPTARG};;
        ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
    esac
done

case $database in
  oracle)
    # todo: remoce below line when docker compose bug is fixed
    docker compose -f docker-compose-oracle.yml pull
    mkdir ../oradata
    sed 's/DB_ENV_FILE/oracle.env/g' docker-compose-dbt-networked.yml | docker compose -f docker-compose-oracle.yml -f - -p local_dev up --build --timeout 60 --detach
    ;;
  postgres)
    mkdir ../postgresdata
    sed 's/DB_ENV_FILE/postgres.env/g' docker-compose-dbt-networked.yml | docker compose -f docker-compose-postgres.yml -f - -p local_dev up --build --timeout 60  --detach
    ;;
    *)
    sed 's/DB_ENV_FILE/external.env/g' docker-compose-dbt.yml | docker compose -f - -p local_dev up --build --timeout 60 --detach
    ;;
esac

sleep 3

while :
do
  DBT_CONTAINER=$(docker ps | grep "local_dev_dbt" | cut -d' ' -f1)
  if [ -z "${DBT_CONTAINER}" ]; then
      echo "waiting for the containers...";
      sleep 3
  else
      break;
  fi
done

echo "Running: docker exec -it ${DBT_CONTAINER} /bin/bash"
docker exec -it ${DBT_CONTAINER} /bin/bash

# todo: wrap in trap statment?
docker compose -p local_dev down