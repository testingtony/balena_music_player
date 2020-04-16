MusicPlayer
===========

The latest version of [Music Player Daemon]() built to run in a Balena.io container.

Features
--------
Set the Custom Configuration Variable **BALENA_HOST_CONFIG_dtoverlay** to load support a specific DAC you're using.

Also set **Define DT parameters** to have **"audio=off"** so that the DAC is still device 0

Set the environment variable **USB_LABEL** to the label of a USB drive (or partition) that will get used for the location for the music files.
(it will also run _update.sh_ in the folder at boot-time to update the collection from an external source.
