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
DOCKERFILE="Dockerfile_ros"
DOCKER_IMAGE="ros"
DOCKER_IMAGE_TAG="noetic"

ROS_DISTRO="noetic"
CMAKE_VERSION=3.25.1
PYTHON3_VERSION=3.10.9
VIM_VERSION=8.2.4919
CLANGD_VERSION=15.0.6

DOCKER_BUILDKIT=1 \
docker build ${SCRIPT_DIR} \
--file ${SCRIPT_DIR}/${DOCKERFILE} \
--tag ${DOCKER_IMAGE}:${DOCKER_IMAGE_TAG} \
--memory=${MAX_MEMORY} \
--memory-swap=${MAX_MEMORY_SWAP} \
--build-arg ROS_DISTRO=${ROS_DISTRO} \
--build-arg COMPILE_JOBS=${COMPILE_JOBS} \
--build-arg CMAKE_VERSION=${CMAKE_VERSION} \
--build-arg VIM_VERSION=${VIM_VERSION} \
--build-arg PYTHON3_VERSION=${PYTHON3_VERSION} \
--build-arg CLANGD_VERSION=${CLANGD_VERSION} \
--network=host \
--build-arg http_proxy=${http_proxy} \
--build-arg HTTP_PROXY=${HTTP_PROXY} \
--build-arg https_proxy=${https_proxy} \
--build-arg HTTPS_PROXY=${HTTPS_PROXY}

############################################################ 
DOCKERFILE="Dockerfile_dev"
BASE_IMAGE="ros"
BASE_TAG="noetic"
DOCKER_IMAGE="ros"
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

########################################################## 
DOCKERFILE="Dockerfile_vslam"
DOCKER_IMAGE="vslam"
DOCKER_IMAGE_TAG="noetic"

ROS_DISTRO="noetic"
EIGEN_VERSION=3.3.0
CERES_VERSION=1.14.0
OPENCV3_VERSION=3.4.16
OPENCV4_VERSION=4.4.0

DOCKER_BUILDKIT=1 \
docker build ${SCRIPT_DIR} \
--file ${SCRIPT_DIR}/${DOCKERFILE} \
--tag ${DOCKER_IMAGE}:${DOCKER_IMAGE_TAG} \
--memory=${MAX_MEMORY} \
--memory-swap=${MAX_MEMORY_SWAP} \
--build-arg ROS_DISTRO=${ROS_DISTRO} \
--build-arg COMPILE_JOBS=${COMPILE_JOBS} \
--build-arg EIGEN_VERSION=${EIGEN_VERSION} \
--build-arg CERES_VERSION=${CERES_VERSION} \
--build-arg OPENCV3_VERSION=${OPENCV3_VERSION} \
--build-arg OPENCV4_VERSION=${OPENCV4_VERSION} \
--network=host \
--build-arg http_proxy=${http_proxy} \
--build-arg HTTP_PROXY=${HTTP_PROXY} \
--build-arg https_proxy=${https_proxy} \
--build-arg HTTPS_PROXY=${HTTPS_PROXY}

############################################################ 
DOCKERFILE="Dockerfile_dev"
BASE_IMAGE="vslam"
BASE_TAG="noetic"
DOCKER_IMAGE="vslam"
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
