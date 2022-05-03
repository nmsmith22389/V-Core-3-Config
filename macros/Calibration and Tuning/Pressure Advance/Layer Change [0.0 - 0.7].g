; 0.2mm layer, 8 bands 5mm each, total height 40mm
if job.layer == null
	M291 P"<div style='color:yellow;font-weight:bold'>You Are Not Printing!</div>" R"Pressure Advance Test Error" S1 T5
elif job.layer == 1
	M572 D0 S0.0
elif job.layer == 25
	M572 D0 S0.01
elif job.layer == 50
	M572 D0 S0.02
elif job.layer == 75
	M572 D0 S0.03
elif job.layer == 100
	M572 D0 S0.04
elif job.layer == 125
	M572 D0 S0.05
elif job.layer == 150
	M572 D0 S0.06
elif job.layer == 175
	M572 D0 S0.07
