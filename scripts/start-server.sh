#!/bin/bash

sleep infinity

libgtk2.0-0:i386 libidn11:i386 libglu1-mesa:i386 libpangox-1.0-0:i386 libpangoxft-1.0-0:i386
http://www.unrealsoftware.de/get.php?get=cs2d_1008_linux.zip&p=1&cid=16295
http://www.unrealsoftware.de/files_pub/cs2d_dedicated_linux.zip

echo "---Checking for CS2D executable ---"
if [ ! -f ${SERVER_DIR}/CS2D ]; then
	cd ${SERVER_DIR}
	echo "---Downloading CS2D---"
    wget -qO CS2D.zip https://github.com/ich777/docker-cs2d-server/raw/master/cs/cs2d_1008_linux.zip
    unzip -qo ${SERVER_DIR}/CS2D.zip
	rm ${SERVER_DIR}/CS2D.zip
    sleep 2
    if [ ! -f ${SERVER_DIR}/CS2D ]; then
    	echo "----------------------------------------------------------------------------------------------------"
    	echo "---Something went wrong, please install CS2D manually. Putting server into sleep mode---"
        echo "----------------------------------------------------------------------------------------------------"
        sleep infinity
    echo "---CS2D successfully downloaded---"
    fi
else
	echo "---CS2D executable found---"
fi

echo "---Checking for CS2D Dedicated Server executable ---"
if [ ! -f ${SERVER_DIR}/cs2d_dedicated ]; then
	cd ${SERVER_DIR}
	echo "---Downloading CS2D Dedicated Server---"
    wget -qO CS2D-dedicated.zip http://www.unrealsoftware.de/files_pub/cs2d_dedicated_linux.zip
    unzip -qo ${SERVER_DIR}/CS2D-dedicated.zip
	rm ${SERVER_DIR}/CS2D-dedicated.zip
    sleep 2
    if [ ! -f ${SERVER_DIR}/cs2d_dedicated ]; then
    	echo "----------------------------------------------------------------------------------------------------"
    	echo "---Something went wrong, please install CS2D Dedicated Server manually. Putting server into sleep mode---"
        echo "----------------------------------------------------------------------------------------------------"
        sleep infinity
    fi
    echo "---CS2D Dedicated Server successfully downloaded---"
else
	echo "---CS2D Dedicated Server executable found---"
fi

echo "---Preparing Server---"
chmod -R 770 ${DATA_DIR}

echo "---Starting Server---"
cd ${SERVER_DIR}
${SERVER_DIR}/cs2d_dedicated -port ${GAME_PORT} ${GAME_PARAMS}