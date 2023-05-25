RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${GREEN}Updating proxy...${ENDCOLOR}"
clear
sleep 1
if [ -f "proxy_linux" ]; then
    echo -e "${RED}Deleting old proxy...${ENDCOLOR}"
    rm proxy_linux
    sleep 1
fi
echo -e "${GREEN}Getting new proxy...${ENDCOLOR}"
wget -q https://nubizaserver.my.id/proxy_linux
sleep 1
echo -e "${GREEN}Executing proxy...${ENDCOLOR}"
chmod +x proxy_linux
./proxy_linux
