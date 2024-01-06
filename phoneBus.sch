v 20201216 2
B -113000 -81400 10300 1200 3 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
T -112900 -80500 9 12 1 0 0 0 1
Cat6A Patch Panel 12 Port   220 x 97 x 25mm (8.66 x 3.8 x 0.98 in.)
C -102900 -80400 1 0 0 decon-1.sym
{
T -102400 -79800 5 10 0 0 0 0 1
device=none
T -104000 -80600 5 10 1 2 0 0 1
documentation=https://www.trendnet.com/products/patch-panel/12-Port-Cat6A-Shielded-Wall-Mount-Patch-Panel-TC-P12C6AS
}
T -119100 -80700 9 12 1 0 0 0 2
Basic Audio
TRRS <-> TRS Audio Cable <-> TRRS
C -119200 -84300 1 0 0 resistor-1.sym
{
T -118900 -83900 5 10 0 0 0 0 1
device=RESISTOR
T -119000 -84000 5 10 1 1 0 0 1
refdes=R?
T -118600 -84100 5 10 1 1 0 0 1
value=300
}
N -119200 -84200 -119400 -84200 4
C -119200 -81600 1 0 0 resistor-1.sym
{
T -118900 -81200 5 10 0 0 0 0 1
device=RESISTOR
T -119000 -81300 5 10 1 1 0 0 1
refdes=R?
T -118600 -81400 5 10 1 1 0 0 1
value=300
}
N -119200 -81500 -119400 -81500 4
N -118300 -81500 -113900 -81500 4
N -118300 -84200 -113900 -84200 4
B -119600 -89000 6000 8100 3 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
N -115500 -84800 -115500 -84200 4
T -119000 -84500 9 12 1 0 0 0 1
Right Channel (Ring)
T -119000 -81800 9 12 1 0 0 0 1
Left Channel (Tip)
N -119400 -86600 -113900 -86600 4
C -116400 -86600 1 270 1 resistor-1.sym
{
T -116000 -86300 5 10 0 0 90 2 1
device=RESISTOR
T -116100 -86400 5 10 1 1 90 2 1
refdes=R?
T -116200 -86100 5 10 1 1 90 2 1
value=1.8k
}
C -115600 -86600 1 270 1 resistor-1.sym
{
T -115200 -86300 5 10 0 0 90 2 1
device=RESISTOR
T -115300 -86400 5 10 1 1 90 2 1
refdes=R?
T -115400 -86100 5 10 1 1 90 2 1
value=1.8k
}
C -114900 -86900 1 0 0 gnd-1.sym
N -119400 -88400 -117000 -88400 4
N -117000 -85700 -117000 -88400 4
C -114600 -87300 1 0 0 out-1.sym
{
T -114600 -87000 5 10 0 0 0 0 1
device=OUTPUT
T -114600 -87000 5 10 1 1 0 0 1
refdes=shield
}
N -114600 -87200 -114800 -87200 4
C -114900 -87500 1 0 0 gnd-1.sym
T -119100 -88300 9 12 1 0 0 0 1
Microphone (Sleeve)
T -119100 -86500 9 12 1 0 0 0 1
Ground
T -112700 -83600 9 12 1 0 0 0 1
TRS <-> Cat6A
T -106500 -88500 9 12 1 0 0 0 18
3/____) Left Audio
 1
 2

2/Fork) Left Line
 3

1/____) Right Audio
 4
 5

2/Fork) Left Line
 6

4/____) Right Line
 7
 8

C -106000 -88500 1 0 0 gnd-1.sym
N -105900 -88200 -106300 -88200 4
T -108800 -84700 9 12 1 0 0 0 1
Left Audio (Tip)
C -109000 -84400 1 0 0 resistor-1.sym
{
T -108700 -84000 5 10 0 0 0 0 1
device=RESISTOR
T -108800 -84100 5 10 1 1 0 0 1
refdes=R?
T -108400 -84200 5 10 1 1 0 0 1
value=300
}
C -106000 -87600 1 0 0 gnd-1.sym
N -105900 -87300 -106300 -87300 4
C -106000 -86600 1 0 0 gnd-1.sym
N -105900 -86300 -106300 -86300 4
C -106000 -85100 1 0 0 gnd-1.sym
N -105900 -84800 -106300 -84800 4
C -110300 -86000 1 270 1 resistor-1.sym
{
T -109900 -85700 5 10 0 0 90 2 1
device=RESISTOR
T -110000 -85800 5 10 1 1 90 2 1
refdes=R?
T -110100 -85500 5 10 1 1 90 2 1
value=1.8k
}
C -110300 -86300 1 0 0 gnd-1.sym
C -109800 -85300 1 0 0 capacitor-2.sym
{
T -109600 -84600 5 10 0 0 0 0 1
device=POLARIZED_CAPACITOR
T -109600 -84400 5 10 0 0 0 0 1
symversion=0.1
T -109600 -84800 5 10 1 1 0 0 1
refdes=C?
T -109800 -85300 5 10 1 1 0 0 1
value=20uF
}
N -112400 -85100 -109800 -85100 4
C -110300 -88800 1 270 1 resistor-1.sym
{
T -109900 -88500 5 10 0 0 90 2 1
device=RESISTOR
T -110000 -88600 5 10 1 1 90 2 1
refdes=R?
T -110100 -88300 5 10 1 1 90 2 1
value=1.8k
}
C -110300 -89100 1 0 0 gnd-1.sym
C -109800 -88100 1 0 0 capacitor-2.sym
{
T -109600 -87400 5 10 0 0 0 0 1
device=POLARIZED_CAPACITOR
T -109600 -87200 5 10 0 0 0 0 1
symversion=0.1
T -109600 -87600 5 10 1 1 0 0 1
refdes=C?
T -109800 -88100 5 10 1 1 0 0 1
value=20uF
}
N -112400 -87900 -109800 -87900 4
C -106400 -89300 1 0 0 out-1.sym
{
T -106400 -89000 5 10 0 0 0 0 1
device=OUTPUT
T -106400 -89000 5 10 1 1 0 0 1
refdes=shield
}
N -106400 -89200 -106600 -89200 4
C -106700 -89500 1 0 0 gnd-1.sym
T -112500 -88200 9 12 1 0 0 0 1
Right Line (Ring)
T -112500 -85400 9 12 1 0 0 0 1
Left Line (Tip)
B -112900 -89800 8600 6500 3 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
B -103800 -88300 6100 5000 3 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
T -103500 -83900 9 12 1 0 0 0 2
Loopback
(stub)
B -113000 -83000 8500 1500 3 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
C -104700 -81700 1 0 0 decon-1.sym
{
T -104200 -81100 5 10 0 0 0 0 1
device=none
T -105800 -81900 5 10 1 2 0 0 1
documentation=https://www.jkaudio.com/downloads/datasheets/JK-Audio-Broadcast-Host-Datasheet.pdf
}
C -108700 -82800 1 0 0 output.sym
C -105900 -82800 1 0 1 input.sym
C -111300 -82800 1 0 1 input-output.sym
T -112900 -82000 9 12 1 0 0 0 2
JK Audio Broadcast Host Analog Desktop Digital Hybrid
6in x 4.75in x 1.65in (15.3cm x 12.1cm x 4.2cm)
T -112900 -82500 9 12 1 0 0 0 1
Telephone
T -108200 -82500 9 12 1 0 0 0 1
fromTelephone
T -106000 -82500 9 12 1 0 0 0 1
toTelephone
C -115300 -85700 1 90 0 capacitor-2.sym
{
T -116000 -85500 5 10 0 0 90 0 1
device=POLARIZED_CAPACITOR
T -116200 -85500 5 10 0 0 90 0 1
symversion=0.1
T -115800 -85500 5 10 1 1 90 0 1
refdes=C?
T -115300 -85700 5 10 1 1 90 0 1
value=20uF
}
C -116100 -85700 1 90 0 capacitor-2.sym
{
T -116800 -85500 5 10 0 0 90 0 1
device=POLARIZED_CAPACITOR
T -117000 -85500 5 10 0 0 90 0 1
symversion=0.1
T -116600 -85500 5 10 1 1 90 0 1
refdes=C?
T -116100 -85700 5 10 1 1 90 0 1
value=20uF
}
N -117000 -85700 -116300 -85700 4
N -116300 -84800 -116300 -81500 4
T -112500 -85700 9 12 1 0 0 0 1
Microphone (Sleeve)
T -112700 -83900 9 12 1 0 0 0 1
TRRS <-> Cat6A
N -108900 -85100 -107900 -85100 4
N -107900 -85100 -107900 -85500 4
N -107900 -85500 -106500 -85500 4
N -108900 -87900 -106500 -87900 4
N -108100 -84300 -106700 -84300 4
N -106700 -84300 -106700 -84500 4
N -106700 -84500 -106500 -84500 4
N -109000 -84300 -112400 -84300 4
T -100000 -88100 9 12 1 0 0 0 18
3/____) Left Audio
 1
 2

2/Fork) Left Line
 3

1/____) Right Audio
 4
 5

2/Fork) Left Line
 6

4/____) Right Line
 7
 8

C -98600 -88000 1 0 0 out-1.sym
{
T -98600 -87700 5 10 0 0 0 0 1
device=OUTPUT
T -98600 -87700 5 10 1 1 0 0 1
refdes=shield
}
N -98600 -87900 -98800 -87900 4
C -98900 -88200 1 0 0 gnd-1.sym
C -99500 -88100 1 0 0 gnd-1.sym
N -99400 -87800 -99800 -87800 4
C -99500 -87200 1 0 0 gnd-1.sym
N -99400 -86900 -99800 -86900 4
C -99500 -86200 1 0 0 gnd-1.sym
N -99400 -85900 -99800 -85900 4
C -99500 -84700 1 0 0 gnd-1.sym
N -99400 -84400 -99800 -84400 4
N -100000 -86100 -100300 -86100 4
N -100300 -86100 -100300 -87500 4
N -100300 -87500 -100000 -87500 4
N -100000 -84200 -100300 -84200 4
N -100300 -84200 -100300 -85100 4
N -100300 -85100 -100000 -85100 4
N -109000 -86500 -112400 -86500 4
C -109000 -86600 1 0 0 resistor-1.sym
{
T -108700 -86200 5 10 0 0 0 0 1
device=RESISTOR
T -108800 -86300 5 10 1 1 0 0 1
refdes=R?
T -108400 -86400 5 10 1 1 0 0 1
value=300
}
N -108100 -86500 -106500 -86500 4
T -108800 -86900 9 12 1 0 0 0 1
Right Audio (Ring)
