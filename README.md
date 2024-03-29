# BashBeep
This script plays a series of notes using the beep command based on the notes names and duration provided in the arguments in the following format:

[note name][octave]:[duration in milliseconds]

#
Examples:
bashbeep.sh C1:500 D2:1000 E3:200
This will play the notes C octave 1 for 500 milliseconds, then D octave 2 for 1000 milliseconds and then E octave 3 for 200 milliseconds.

bashbeep.sh A#2:300 G#1:400
This will play the notes A#2 for 300 milliseconds and G#1 for 400 milliseconds.

bashbeep.sh P:1000 C2:500 P:500 E3:200
This will pause for 1000 milliseconds, play the note C2 for 500 milliseconds, pause for 500 milliseconds, and play the note E3 for 200 milliseconds.
