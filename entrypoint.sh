#!/bin/sh

# Try to set the Raspberry Pi's hostname to the application device name
curl -X PATCH --header "Content-Type:application/json" \
    --data '{"network": {"hostname": "'$BALENA_DEVICE_NAME_AT_INIT'"}}' \
    "$BALENA_SUPERVISOR_ADDRESS/v1/device/host-config?apikey=$BALENA_SUPERVISOR_API_KEY"

if [ ! -z $USB_LABEL ]
then
    MUSIC_DIR=/var/lib/mpd/music
    mkdir -p ${MUSIC_DIR}
    mount LABEL=${USB_LABEL} ${MUSIC_DIR}
    test -x ${MUSIC_DIR}/update.sh && ${MUSIC_DIR}/update.sh
    cp /etc/mpd.conf.local /etc/mpd.conf
else
    cp /etc/mpd.conf.upnp /etc/mpd.conf
fi

exec "${@}"
