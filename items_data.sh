RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"
fmb=2097152 # 2 megabyte

sleep 1
if [ -f "items.dat" ]; then
    echo -e "${RED}Deleting old items.dat...${ENDCOLOR}"
    rm items.dat
fi

echo -e "${GREEN}Downloading items data...${ENDCOLOR}"
while true
do
    sleep 2
    curl -L# https://nubiza.my.id/items.dat -o items.dat
    if [ -f "items.dat" ]; then
        file_size=$(wc -c items.dat | awk '{print $1}')  # Get the size of the file in bytes
        if [ "$file_size" -lt "$fmb" ]; then
            rm -f items.dat
            echo -e "${RED}Invalid file size, ${BG_YELLOW}${WHITE}Retrying...${ENDCOLOR}"
        else
            echo -e "${GREEN}items.dat downloaded${ENDCOLOR}"
            break
        fi
    else
      echo -e "${RED}Failed To download items.dat, ${BG_YELLOW}${WHITE}Retrying...${ENDCOLOR}"
    fi
done
