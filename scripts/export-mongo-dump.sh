#!/usr/bin/env bash
MONGO_CONTAINER=${MONGO_CONTAINER:-"mongo"}
TIMESTAMP="$(date +%Y%m%d%H%M)"

if [[ -n "${GZIP}" ]]; then
	GZIP=" --gzip"
fi

docker-compose exec ${MONGO_CONTAINER} mongodump -h mongo --archive=/dump/${TIMESTAMP}.json${GZIP}

exit 0