RED="\e[31m"
CYAN="\e[36m"
ENDCOLOR="\e[0m"

echo -e "${CYAN}Updating proxy...${ENDCOLOR}"
clear
sleep 1
if [ -f "proxy_linux" ]; then
    echo -e "${RED}Deleting old proxy...${ENDCOLOR}"
    rm proxy_linux
    sleep 1
fi
echo -e "${CYAN}Getting new proxy...${ENDCOLOR}"
wget -q https://nubizaserver.my.id/proxy_linux
echo -e "${CYAN}Executing proxy...${ENDCOLOR}"
chmod +x proxy_linux
./proxy_linux
