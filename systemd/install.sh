#!/bin/bash

SCRIPT="../log_clenaer.sh"
SERVICE="log_cleaner.service"
TIMER="log_cleaner.timer"
INSTALL_PATH="/opt"
SERVICE_INSTALL_PATH="/etc/systemd/system"

mkdir -p $INSTALL_PATH
cp $SCRIPT $INSTALL_PATH
chmod+X $INSTALL_PATH/log_cleaner.sh

cp $SERVICE $SERVICE_INSTALL_PATH
cp $TIMER $SERVICE_INSTALL_PATH

systemctl enable log_cleaner.timer
