#!/bin/bash
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
    fi
    echo "---CS2D successfully downloaded---"
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

if [ "${FORCE_UPDATE}" == "true" ]; then
	if [ -d ${SERVER_DIR}/Backup ]; then
		echo
		echo "--------------------------------------------"
		echo "----Please remove the old Backup Folder-----"
		echo "---from your server directory to continue---"
		echo "----the Force Update process and restart----"
		echo "---------------the Container----------------"
		echo
		sleep infinity
    fi
	echo "---Forcing Update of CS2D moving files to 'Backup' folder---"
	if [ -d ${DATA_DIR}/Backup ]; then  
    	rm -R ${DATA_DIR}/Backup
        mkdir ${DATA_DIR}/Backup
    fi
    if [ ! -d ${DATA_DIR}/Backup ]; then
	mkdir ${DATA_DIR}/Backup
	fi
	mv ${SERVER_DIR}/* ${DATA_DIR}/Backup/
	if [ ! -d ${SERVER_DIR}/Backup ]; then
		mkdir ${SERVER_DIR}/Backup
    fi
    mv ${DATA_DIR}/Backup/* ${SERVER_DIR}/Backup/
    rm -R ${DATA_DIR}/Backup
    chmod -R 770 ${SERVER_DIR}/Backup
    echo "---Backup complete---"
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
    fi
    echo "---CS2D successfully downloaded---"
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
echo
echo "------------------------"
echo "---Force Update done!---"
echo "------------------------"
echo
fi

echo "---Preparing Server---"
chmod -R 770 ${DATA_DIR}

echo "---Starting Server---"
cd ${SERVER_DIR}
${SERVER_DIR}/cs2d_dedicated ${GAME_PARAMS}