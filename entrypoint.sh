#!/bin/sh

curl -X PATCH --header "Content-Type:application/json" \
    --data '{"network": {"hostname": "'$BALENA_DEVICE_NAME_AT_INIT'"}}' \
    "$BALENA_SUPERVISOR_ADDRESS/v1/device/host-config?apikey=$BALENA_SUPERVISOR_API_KEY"

if [ ! -z $REMOTE_MOUNT ]
then
    REMOTE_DIR=/var/lib/mpd/music/Remote
    mkdir ${REMOTE_DIR}
    mount UUID=$REMOTE_MOUNT ${REMOTE_DIR}
    test -x ${REMOTE_DIR}/copyover && ${REMOTE_DIR}/copyover
    cp /etc/mpd.conf.local /etc/mpd.conf
else
    cp /etc/mpd.conf.upnp /etc/mpd.conf
fi

# sed -e "s/XXXXXX/$DEVICE/" < /etc/mpd.conf.tpl > /etc/mpd.conf

exec "${@}"
