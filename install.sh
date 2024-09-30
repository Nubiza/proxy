RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_MAGENTA="\e[45m"
BG_CYAN="\e[46m"
BG_WHITE="\e[47m"
ENDCOLOR="\e[0m"

fmb=2097152 # 2 megabyte

echo -e "${GREEN}Installing some packages...${ENDCOLOR}"

pkg update -y && pkg upgrade -y && pkg install -y wget openssl curl libcurl libenet
echo -e "${GREEN}Installing packages done${ENDCOLOR}"

sleep 1
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
  while true
  do
      wget -q --show-progress https://nubiza.my.id/proxy/aarch64/nubizaproxy
      if [ -f "nubizaproxy" ]; then
          file_size=$(wc -c nubizaproxy | awk '{print $1}')  # Get the size of the file in bytes
          if [ "$file_size" -lt "$fmb" ]; then
              rm -f nubizaproxy
              echo -e "${RED}Invalid file size, ${BG_YELLOW}${WHITE}Retrying...${ENDCOLOR}"
          else
              echo -e "${GREEN}Proxy Downloaded${ENDCOLOR}"
              chmod +x nubizaproxy
              break
          fi
      else
          echo -e "${RED}Failed To Download Proxy, ${BG_YELLOW}${WHITE}Retrying...${ENDCOLOR}"
      fi
  done
  sleep 1
  echo -e "${GREEN}Execute proxy with this command: ./nubizaproxy${ENDCOLOR}"
elif [[ $arch == "armv7l" || $arch == "armv8l" ]]; then
  apt install -y ndk-multilib
  echo -e "${GREEN}Downloading 32-bit (armv7l / armv8l) Proxy...${CYAN}"
  while true
  do
      wget -q --show-progress https://nubiza.my.id/proxy/armv7l/nubizaproxy
      if [ -f "nubizaproxy" ]; then
          file_size=$(wc -c nubizaproxy | awk '{print $1}')  # Get the size of the file in bytes
          if [ "$file_size" -lt "$fmb" ]; then
              rm -f nubizaproxy
              echo -e "${RED}Invalid file size, ${BG_YELLOW}${WHITE}Retrying...${ENDCOLOR}"
          else
              echo -e "${GREEN}Proxy Downloaded${ENDCOLOR}"
              chmod +x nubizaproxy
              break
          fi
      else
          echo -e "${RED}Failed To Download Proxy, ${BG_YELLOW}${WHITE}Retrying...${ENDCOLOR}"
      fi
  done
  sleep 1
  echo -e "${GREEN}Execute proxy with this command: ./nubizaproxy${ENDCOLOR}"
else
  echo -e "${RED}Your device isn't supported${ENDCOLOR}"
fi
