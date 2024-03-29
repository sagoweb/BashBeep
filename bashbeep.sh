#!/bin/bash
# Filename: gp-play-notes.sh

# This script plays a series of notes using the beep command based on the notes names and duration provided in the arguments
# in the following format [note name][octave]:[duration in milliseconds]
# For example "C1:500" will play the note C at octave 1 for 500 milliseconds
# C2:500 will play the note C at octave 2 for 500 milliseconds


if [ $# -eq 0 ]; then
    echo "Usage: gp-play-notes.sh [note1][octave1]:[duration1] [note2][octave2]:[duration2] ..."
    exit 1
fi


for arg in "$@"
do
    note=$(echo $arg | awk -F: '{print $1}' | rev | cut -c 2- | rev | tr '[:lower:]' '[:upper:]')
    octave=$(echo $arg | awk -F: '{print $1}' | grep -o '[0-9]*$')
    duration=$(echo $arg | awk -F: '{print $2}')

    if [ -z "$octave" ]; then
        octave=1
    fi

    octaveFactor=$((2 ** ($octave - 1)))
    
    # Translate the note name and octave to the corresponding frequency
    case $note in
        "C") frequency=$((130 * octaveFactor)) ;;
        "C#") frequency=$((138 * octaveFactor)) ;;
        "D") frequency=$((146 * octaveFactor)) ;;
        "D#") frequency=$((155 * octaveFactor)) ;;
        "E") frequency=$((164 * octaveFactor)) ;;
        "F") frequency=$((174 * octaveFactor)) ;;
        "F#") frequency=$((185 * octaveFactor)) ;;
        "G") frequency=$((196 * octaveFactor)) ;;
        "G#") frequency=$((208 * octaveFactor)) ;;
        "A") frequency=$((220 * octaveFactor)) ;;
        "A#") frequency=$((233 * octaveFactor)) ;;
        "B") frequency=$((246 * octaveFactor)) ;;
        "P") frequency=1 ;; # Pause
        *) echo "Invalid note name: $note"; exit 1 ;;
    esac

    
    beep -f $frequency -l $duration
    
done


