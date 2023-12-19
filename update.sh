RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
ENDCOLOR="\e[0m"

clear
echo -e "${GREEN}Installing Nubiza Proxy...${ENDCOLOR}"
sleep 1
if [ -f "nubizaproxy" ]; then
    echo -e "${RED}Deleting old proxy...${ENDCOLOR}"
    rm nubizaproxy
    sleep 1
    echo -e "${GREEN}Getting proxy...${ENDCOLOR}"
fi

arch=$(uname -m)
if [[ $arch = "aarch64" ]]; then
  echo -e "${GREEN}Downloading 64-bit (aarch64) Proxy...${CYAN}"
  wget -q --show-progress https://nubiza.my.id/proxy/aarch64/nubizaproxy
  sleep 1
  echo -e "Proxy Downloaded${ENDCOLOR}"
  echo -e "${GREEN}Executing Proxy${ENDCOLOR}"
  chmod +x nubizaproxy
  ./nubizaproxy
elif [[ $arch == "armv7l" || $arch == "armv8l" ]]; then
  apt install -y ndk-multilib
  echo -e "${GREEN}Downloading 32-bit (armv7l / armv8l) Proxy...${CYAN}"
  wget -q --show-progress https://nubiza.my.id/proxy/armv7l/nubizaproxy
  sleep 1
  echo -e "Proxy Downloaded${ENDCOLOR}"
  echo -e "${GREEN}Executing Proxy${ENDCOLOR}"
  chmod +x nubizaproxy
  ./nubizaproxy
else
  echo -e "${RED}Your phone isn't supported${ENDCOLOR}"
fi
