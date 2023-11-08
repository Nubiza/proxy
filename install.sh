RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
ENDCOLOR="\e[0m"

clear
echo -e "${GREEN}Installing Proxy...${ENDCOLOR}"
sleep 1
if [ -f "proxy_linux" ]; then
    echo -e "${RED}Deleting old proxy...${ENDCOLOR}"
    rm proxy_linux
    sleep 1
    echo -e "${GREEN}Getting proxy...${ENDCOLOR}"
fi

arch=$(uname -m)
if [[ $arch = "aarch64" ]]; then
  echo -e "${GREEN}Downloading 64-bit (aarch64) Proxy...${CYAN}"
  wget -q --show-progress https://nubizaserver.my.id/aarch64/proxy_linux
  sleep 1
  echo -e "Proxy is Downloaded${ENDCOLOR}"
  echo -e "${GREEN}Execute proxy with this command: ./proxy_linux${ENDCOLOR}"
  chmod +x proxy_linux
elif [[ $arch == "armv7l" || $arch == "armv8l" ]]; then
  apt install -y ndk-multilib
  echo -e "${GREEN}Downloading 32-bit (armv7l / armv8l) Proxy...${CYAN}"
  wget -q --show-progress https://nubizaserver.my.id/armv7l/proxy_linux
  sleep 1
  echo -e "Proxy is Downloaded${ENDCOLOR}"
  echo -e "${GREEN}Execute proxy with this command: ./proxy_linux${ENDCOLOR}"
  chmod +x proxy_linux
else
  echo -e "${RED}Your phone isn't supported${ENDCOLOR}"
fi
