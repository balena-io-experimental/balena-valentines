#!/bin/bash

export EPD_MOUNTPOINT=/dev/epd
export EPD_SIZE=2.7
export EPD_OPTS="-o allow_other -o default_permissions"

mkdir -p $EPD_MOUNTPOINT
epd_fuse --panel=$EPD_SIZE $EPD_OPTS $EPD_MOUNTPOINT
papirus-set $EPD_SIZE

papirus-draw /usr/app/balena_logo_valentine.png