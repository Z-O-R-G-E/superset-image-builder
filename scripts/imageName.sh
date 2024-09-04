function setBaseImageName() {
    while :
      do
        read -p "Укажите имя базового образа: " BASE_IMAGE_NAME;

        if [[ -n "${BASE_IMAGE_NAME}" ]];
          then
            break;
      fi
    done
    local message="Имя базового образа: ${BASE_IMAGE_NAME}";
    echo "${message}";
    export BASE_IMAGE_NAME;
}

function setBuiltImageName() {
    while :
      do
        read -p "Укажите имя создаваемого образа (по умолчанию - ${BASE_IMAGE_NAME}-new): " BUILT_IMAGE_NAME;

        if [[ -z "${BUILT_IMAGE_NAME}" ]];
          then
            BUILT_IMAGE_NAME="${BASE_IMAGE_NAME}-new";
            break;
        elif [[ "${BUILT_IMAGE_NAME}" =~ [[:blank:]]{1,} ]];
          then
            BUILT_IMAGE_NAME=$(sed -E "s/[[:blank:]]{1,}/-/g" <<< "${BUILT_IMAGE_NAME}")
            break;
        else
          break;
        fi
    done
      local message="Имя нового образа: ${BUILT_IMAGE_NAME}";
      echo "${message}";
      export BUILT_IMAGE_NAME;
}