#!/bin/sh

TIMEOUT=900

# Define the number of seconds of inactivity before the screen is turned off and the session is locked
xset dpms $TIMEOUT $TIMEOUT $TIMEOUT
xset s $TIMEOUT $TIMEOUT
