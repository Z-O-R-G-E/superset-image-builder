function setContainerId() {
    while :
      do
          read -p "Укажите ID контейнера: " CONTAINER_ID;

          if [[ -n "${CONTAINER_ID}" ]];
              then
                break;
          fi
      done
    local message="ID контейнера: ${CONTAINER_ID}";
    echo "${message}";
    export CONTAINER_ID;
}