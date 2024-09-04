function getPlatform(){
  ARCH=$(uname -m)
  if [[ "$ARCH" == x86_64 || "$ARCH" == x86 || "$ARCH" == amd64 ]];
    then
      export PLATFORM="linux/amd64";
  elif [[ "$ARCH" == AArch64 || "$ARCH" == arm64 || "$ARCH" == ARMv8 || "$ARCH" == ARMv9 ]];
    then
      export PLATFORM="linux/arm64";
  fi
  local message="Платформа сборки: ${PLATFORM}";
  echo "${message}";
}