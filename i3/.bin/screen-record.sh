#!/bin/bash

# Function to show a menu for controlling the recording
control_menu() {
	while true; do
		OPTION=$(whiptail --title "Control Recording" --menu "Choose an action" 15 60 4 \
			"1" "Pause" \
			"2" "Resume" \
			"3" "Stop" 3>&1 1>&2 2>&3)

		case $OPTION in
		1)
			echo "Pausing recording..."
			pkill -SIGSTOP ffmpeg
			;;
		2)
			echo "Resuming recording..."
			pkill -SIGCONT ffmpeg
			;;
		3)
			echo "Stopping recording..."
			pkill -SIGINT ffmpeg
			break
			;;
		*)
			break
			;;
		esac
	done
}

# Get the list of audio sources
AUDIO_SOURCES=$(pactl list short sources | awk '{print $2}')

# Create an array for whiptail options
OPTIONS=()
i=1
for SOURCE in $AUDIO_SOURCES; do
	OPTIONS+=($i "$SOURCE")
	((i++))
done

# Show a menu to select the audio source
AUDIO_SOURCE=$(whiptail --title "Select Audio Source" --menu "Choose an audio input device" 15 60 4 "${OPTIONS[@]}" 3>&1 1>&2 2>&3)

if [ $? -ne 0 ]; then
	echo "No audio source selected. Exiting."
	exit 1
fi

# Convert the selected option number to the actual source
AUDIO_SOURCE=${OPTIONS[((AUDIO_SOURCE * 2) - 1)]}

# Select screen area
AREA=$(slop -f "%wx%h+%x,%y")

# Prompt for the filename
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
DEFAULT_FILENAME=~/Videos/screenrecord-$TIMESTAMP.mp4
FILENAME=$(whiptail --inputbox "Enter the filename for the recording:" 10 60 "$DEFAULT_FILENAME" 3>&1 1>&2 2>&3)

if [ $? -ne 0 ]; then
	echo "No filename provided. Exiting."
	exit 1
fi

# Beep sound and 5 seconds delay before starting the recording
echo "Recording will start in 5 seconds..."
beep
sleep 5

# Start recording in the background
ffmpeg -f x11grab -s $(echo $AREA | cut -d '+' -f 1) -i :0.0+$(echo $AREA | cut -d '+' -f 2) -f pulse -i $AUDIO_SOURCE "$FILENAME" &

# Show control menu
control_menu
