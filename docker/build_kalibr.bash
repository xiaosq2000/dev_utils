#!/bin/bash

# the directory of current bash script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# resource allocation
COMPILE_JOBS="12"
MAX_MEMORY="12g"
MAX_MEMORY_SWAP="12g"
# networking
http_proxy=${http_proxy}
HTTP_PROXY=${HTTP_PROXY}
https_proxy=${https_proxy}
HTTPS_PROXY=${HTTPS_PROXY}

############################################################ 
DOCKERFILE="Dockerfile_kalibr"
BASE_IMAGE="vslam"
BASE_TAG="noetic"
DOCKER_IMAGE="kalibr"
DOCKER_IMAGE_TAG="noetic"

DOCKER_BUILDKIT=1 \
docker build ${SCRIPT_DIR} \
--file ${SCRIPT_DIR}/${DOCKERFILE} \
--tag ${DOCKER_IMAGE}:${DOCKER_IMAGE_TAG} \
--memory=${MAX_MEMORY} \
--memory-swap=${MAX_MEMORY_SWAP} \
--build-arg BASE_IMAGE=${BASE_IMAGE} \
--build-arg BASE_TAG=${BASE_TAG} \
--network=host \
--build-arg http_proxy=${http_proxy} \
--build-arg HTTP_PROXY=${HTTP_PROXY} \
--build-arg https_proxy=${https_proxy} \
--build-arg HTTPS_PROXY=${HTTPS_PROXY}

############################################################ 
DOCKERFILE="Dockerfile_dev"
BASE_IMAGE="kalibr"
BASE_TAG="noetic"
DOCKER_IMAGE="kalibr"
DOCKER_IMAGE_TAG="noetic_dev"
CACHE_DATE=$(date)
CACHE_DATE=${CACHE_DATE// /_} # replace spaces with underscores

DOCKER_BUILDKIT=1 \
docker build ${SCRIPT_DIR} \
--file ${SCRIPT_DIR}/${DOCKERFILE} \
--tag ${DOCKER_IMAGE}:${DOCKER_IMAGE_TAG} \
--memory=${MAX_MEMORY} \
--memory-swap=${MAX_MEMORY_SWAP} \
--build-arg BASE_IMAGE=${BASE_IMAGE} \
--build-arg BASE_TAG=${BASE_TAG} \
--build-arg CACHE_DATE=${CACHE_DATE} \
--network=host \
--build-arg http_proxy=${http_proxy} \
--build-arg HTTP_PROXY=${HTTP_PROXY} \
--build-arg https_proxy=${https_proxy} \
--build-arg HTTPS_PROXY=${HTTPS_PROXY}
