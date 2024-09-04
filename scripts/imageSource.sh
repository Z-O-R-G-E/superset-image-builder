#!/bin/bash

function setSource() {
  echo "Источники: "
  local PS3="Выберите источник базового образа: "
  local dockerHub="Образ из Docker Hub"
  local container="Образ из контейнера"
  local local="Локальный образ"

  select source in "${dockerHub}" "${container}" "${local}" Выйти
  do
    case $source in
      "${dockerHub}")
        export IMAGE_SOURCE="dockerHub";
        break;;
      "${container}")
        export IMAGE_SOURCE="container";
        break;;
      "${local}")
        export IMAGE_SOURCE="local";
        break;;
      "Выйти")
        echo "Выход";
        exit;;
      *)
        echo "Указан несуществующий пункт";;
    esac
  done
  local message="Источник: ${source}";
  echo "${message}";
}