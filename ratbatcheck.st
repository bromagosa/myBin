#!/usr/bin/gst
|batteryPercentage isCharging ratTalker system|

ratTalker := [ :text | Smalltalk system: 'ratpoison -d:0.0 -c "echo ', text , '"' ].
sysTalker := [ :text | Smalltalk system: 'echo "', text ,'\n" | wall' ].
system := [ :aCommand | (FileDescriptor popen: aCommand dir: 'r') contents ].
batteryPercentage :=  (system value: 'acpi -b | awk -F, ''{print $2}'' | awk -F% ''{print $1}'' | awk ''{print $1}''') asNumber.
isCharging := ((FileDescriptor popen: 'acpi -b | awk ''{print $3}''' dir: 'r') contents at: 1) = $C.

isCharging ifFalse: [
	(batteryPercentage < 1) 
		ifTrue: [ ratTalker value: 'Warning! Less than 1% of battery left'. 
			sysTalker value: 'Warning! Less than 1% of battery left'. 
			system value: 'halt' ]
		ifFalse: [
			(batteryPercentage < 5) 
				ifTrue: [ ratTalker value: 'Warning! Less than 5% of battery left'.
					sysTalker value: 'Warning! Less than 5% of battery left'.
                                        Smalltalk system: 'mplayer /usr/share/sounds/freedesktop/stereo/complete.oga'. ]
				ifFalse: [
					(batteryPercentage < 10) 
						ifTrue: [ ratTalker value: 'Warning! Less than 10% of battery left'. ]]]].
