var enableTouchSW = false;

; -------------

M401

if var.enableTouchSW
	echo "Enabling Touch Switch..."
	M98 P"Probe/TouchSW.g" ; Touch SW

set global.ProbingBed = 1