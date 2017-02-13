#!/usr/local/bin/gst
|batteryPercentage isCharging ratTalker system|

ratTalker := [:text | Smalltalk system: 'ratpoison -d:0.0 -c "echo ', text , '"'].
"sysTalker := [:text | Smalltalk system: 'echo "', text ,'" | wall']."
system := [:aCommand | (FileDescriptor popen: aCommand dir: 'r') contents].
batteryPercentage :=  (system value: 'acpi -b | awk -F, ''{print $2}'' | awk -F% ''{print $1}'' | awk ''{print $1}''') asNumber.
isCharging := ((FileDescriptor popen: 'acpi -b | awk ''{print $3}''' dir: 'r') contents at: 1) = $C.

isCharging ifFalse: [
	(batteryPercentage < 1) 
		ifTrue: [ratTalker value: 'Warning! Less than 1% of battery left'. 
			sysTalker value: 'Warning! Less than 1% of battery left'. 
			system value: 'halt']
		ifFalse: [
			(batteryPercentage < 15) 
				ifTrue: [ratTalker value: 'Warning! Less than 15% of battery left'.
					sysTalker value: 'Warning! Less than 15% of battery left'.]
				ifFalse: [
					(batteryPercentage < 25) 
						ifTrue: [ratTalker value: 'Warning! Less than 25% of battery left'.
							sysTalker value: 'Warning! Less than 25% of battery left'.
							]]]].
