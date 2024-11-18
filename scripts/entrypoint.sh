#!/bin/bash

usage="$(basename "$0") [-h] [--debug] [--logs] [--no-server] [--server]\n\n

optional arguments:\n
\t  -h  show this help message and exit\n
\t  --debug run bash inside RADI\n
\t  --logs record logs and run RADI\n
\t  --no-server run RADI without webserver
\t  --server run RADI with webserver
\t  --bt run BT Studio"

debug=false
log=false
webserver=true
btstudio=false

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -h | --help )
    echo -e $usage
    exit
    ;;
  -d | --debug )
    shift; debug=true
    ;;
  -l | --logs )
    shift; log=true
    ;;
  -ns | --no-server )
    webserver=false
    ;;
  -s | --server )
    webserver=true
    ;;
  --bt )
    btstudio=true
    webserver=false
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

# If DRI_NAME is empty, run set_dri_name to try and set it automatically
if [ -z "${DRI_NAME}" ]; then
    source set_dri_name.sh
fi

if [ $webserver == true ]; then
    runserver="python3 /RoboticsAcademy/manage.py runserver 0.0.0.0:7164"
else
    runserver=""
fi

if [ $btstudio == true ]; then
    runbt="python3 /BtStudio/backend/manage.py runserver 0.0.0.0:7164 & $(cd /BtStudio/frontend && yarn start)"
else
    runbt=""
fi

echo BTSTUDIO "$runbt"

runram="python3 RoboticsApplicationManager/manager/manager/manager.py 0.0.0.0 7163"
root="cd /"

# TEST LOGS
if [ $log == true ]; then
    DATE_TIME=$(date +%F-%H-%M) # FORMAT year-month-date-hours-mins
    mkdir -p /root/.roboticsacademy/log/$DATE_TIME/
    script -q -c "$root & $runserver & $runbt & $runram ;" /root/.roboticsacademy/log/$DATE_TIME/manager.log
    cp -r /root/.ros/log/* /root/.roboticsacademy/log/$DATE_TIME
else
    if [ $debug == true ]; then
      { bash ; }
    else
      { $root & $runserver & $runram ; }
    fi
fi
