#!/bin/bash

. ./scripts/containerId.sh;
. ./scripts/imageName.sh;
. ./scripts/imageSource.sh;
. ./scripts/imageTag.sh;
. ./scripts/platform.sh;

setSource;

if [[ "${IMAGE_SOURCE}" == "container" ]];
  then
    setContainerId;

    docker commit "${CONTAINER_ID}" "tmp-image-from-container";
    BASE_IMAGE_NAME="tmp-image-from-container";
    BASE_IMAGE_TAG="latest"
fi

getPlatform;

if [[ "${IMAGE_SOURCE}" != "container" ]];
  then
    setBaseImageName;
    setBaseImageTag;
fi

setBuiltImageName;
setBuiltImageTag;

if [[ "${IMAGE_SOURCE}" == "dockerHub" ]];
  then
    docker pull \
    --platform "${PLATFORM}" \
    "${BASE_IMAGE_NAME}":"${BASE_IMAGE_TAG}"
fi

docker build \
-t "${BUILT_IMAGE_NAME}":"${BUILT_IMAGE_TAG}" \
--platform "${PLATFORM}" \
--build-arg BUILD_PLATFORM="${PLATFORM}" \
--build-arg IMAGE_NAME="${BASE_IMAGE_NAME}" \
--build-arg IMAGE_TAG="${BASE_IMAGE_TAG}" \
--force-rm \
--no-cache .

if [[ "${IMAGE_SOURCE}" == "dockerHub" ]];
  then
    docker image rm "${BASE_IMAGE_NAME}":"${BASE_IMAGE_TAG}";
fi

if [[ "${IMAGE_SOURCE}" == "container" ]];
  then
    docker image rm "tmp-image-from-container";
fi