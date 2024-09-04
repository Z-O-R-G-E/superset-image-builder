function setBaseImageTag() {
  while :
    do
      read -p "Укажите версию базового образа (по умолчанию - latest): " BASE_IMAGE_TAG;

      if [[ -z "${BASE_IMAGE_TAG}" ]];
        then
          BASE_IMAGE_TAG="latest";
          break;
      elif [[ "${BASE_IMAGE_TAG}" =~ ^[0-9]{1,2}[.][0-9]{1,2}[.][0-9]{1,3}$ ]];
        then
          break;
      fi

      echo "Неверный формат версии (шаблон 0.0.0)";
    done

    local message="Версия базового образа: ${BASE_IMAGE_TAG}";
    echo "${message}";
    export BASE_IMAGE_TAG;
}

function setBuiltImageTag() {
  while :
    do
      read -p "Укажите версию нового образа (по умолчанию - latest): " BUILT_IMAGE_TAG;

      if [[ -z "${BUILT_IMAGE_TAG}" ]];
        then
          BUILT_IMAGE_TAG="latest";
          break;
      elif [[ "${BUILT_IMAGE_TAG}" =~ ^[0-9]{1,2}[.][0-9]{1,2}[.][0-9]{1,3}$ ]];
        then
          break;
      fi

      echo "Неверный формат версии (шаблон 0.0.0)";
    done

    local message="Версия нового образа: ${BUILT_IMAGE_TAG}";
    echo "${message}";
    export BUILT_IMAGE_TAG;
}