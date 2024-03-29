#!/bin/sh

TIMEOUT=900

# Set the number of seconds of inactivity before the screen saver is activated (which also locks the session)
xset s $TIMEOUT $TIMEOUT
