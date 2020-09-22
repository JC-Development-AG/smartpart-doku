<?xml version="1.0" encoding="UTF-8"?><ScriptObject><Version>1.0</Version><ScriptVersion>1.0</ScriptVersion><Name><![CDATA[IPE]]></Name><Type>1</Type><UUID>bbcd6c71-b5ce-49d0-b2af-4b4fb6a7350d</UUID><Language>de</Language><StringTable/><RelativeOrigin>0.0000000000000000 0.5000000000000000 0.5000000000000000</RelativeOrigin><AbsoluteOrigin>0.0000000000000000 0.0000000000000000 0.0000000000000000</AbsoluteOrigin><SeparateExecParts>1</SeparateExecParts><AutoPlaceResourceObjects>1</AutoPlaceResourceObjects><Scale>1</Scale><Use3DPreview>0</Use3DPreview><IsLocked>0</IsLocked><IsEncrypted>0</IsEncrypted><Key><![CDATA[]]></Key><CalledMacros/><Parameters><Type>1</Type><MapPenToColor>0</MapPenToColor><Parameter><Identifier>half_beam</Identifier><Name><![CDATA[halber Träger]]></Name><Group><![CDATA[]]></Group><Type>4</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>0.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>profile_name</Identifier><Name><![CDATA[Profilname]]></Name><Group><![CDATA[]]></Group><Type>3</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>3</Type><StringValue><![CDATA[IPE 300]]></StringValue><DoubleValue>0.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_x</Identifier><Name><![CDATA[Breite]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>1</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>0.150000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_y</Identifier><Name><![CDATA[Höhe]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>2</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>0.300000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_z</Identifier><Name><![CDATA[Länge]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>3</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>1.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>rounded</Identifier><Name><![CDATA[Rundungen darstellen]]></Name><Group><![CDATA[]]></Group><Type>4</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>4</Type><StringValue/><DoubleValue>1.000000000000</DoubleValue></Value></CurrentValue></Parameter></Parameters><Script><PartParameter><Enable>1</Enable><Text><![CDATA[!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org

VALUES "profile_name" "IPE 80" , "IPE 100" , "IPE 120" , "IPE 140" , 
"IPE 160" , "IPE 180" , "IPE 200" , "IPE 220" , "IPE 240" , "IPE 270" , 
"IPE 300" , "IPE 330" , "IPE 360" , "IPE 400" , "IPE 450" , "IPE 500" , 
"IPE 550" , "IPE 600" , 
"IPEo 180" , "IPEo 200" , "IPEo 220" , "IPEo 240" , "IPEo 270", "IPEo 300" ,
"IPEo 330" , "IPEo 360" , "IPEo 400" , "IPEv 400" , "IPEo 450", "IPEv 450" ,
"IPEo 500" , "IPEv 500" , "IPEo 550" , "IPEv 550" , "IPEo 600", "IPEv 600"

]]></Text></PartParameter><PartMaster><Enable>0</Enable><Text><![CDATA[]]></Text></PartMaster><Part2D>&gt;<Enable>0</Enable><Text><![CDATA[]]></Text></Part2D><Part3D><Enable>1</Enable><Text><![CDATA[!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org



GOSUB profile_name ! setup profile data (h, b, s, t, r)

!create_handles: beam length handle for ref_z
HANDLE 0 , 0 , 0 , 1 , "ref_z" , 1 
HANDLE 0 , 0 , REF_Z , 1 , "ref_z" , 2 
HANDLE 0 , 0 , -1 , 1 , "ref_z" , 3 
! set reference box parameters
PARAMETERS REF_X = b , REF_Y = h 
! end of create_handles


! Create I-beam:
! Beam is double symmetric
! Create one quater and mirror&copy the rest

IF rounded THEN ! with rounded corners
	
	
! beam_with_parallel_flange
GROUP quater_1
PRISM_ 7 , REF_Z , 
0 , 0 , 0 , 
b / 2 , 0 , 0 , 
0 , t , 100 , 
( b / 2 ) - ( s / 2 + r ) , 180 , 200 , 
r , -90 , 2000 , 
s / 2 , h / 2 , 0 , 
0 , h / 2 , 0 
GROUP_END 

	
ELSE ! with sharp corners
	
! beam_with_sharp_corners
GROUP quater_1
PRISM_ 6 , REF_Z , 
0 , 0 , 0 , 
b / 2 , 0 , 0 , 
b / 2 , t , 0 , 
s / 2 , t , 0 , 
s / 2 , h / 2 , 0 , 
0 , h / 2 , 0 
GROUP_END 

ENDIF 
! end of base-part


GROUP "quater_2" 
SCALEX -1 ! mirror about x-axis

GROUP_PLACE "quater_1" 
GROUP_END 
lower_part = GROUP_UNION ( "quater_1" , "quater_2" ) 


IF half_beam THEN 
   GROUP_PLACE lower_part 
   GOTO "end"
ENDIF 


GROUP "upper_part" 
TRANSY h 
SCALEY -1 ! mirror about y-axis

GROUP_PLACE lower_part 
GROUP_END 

GROUP_PLACE GROUP_UNION ( lower_part , "upper_part" ) 

 
"end":
END






"IPE 80": 
h = 0.08
b = 0.046
s = 0.0038
t = 0.0052
r = 0.005
RETURN


"IPE 100": 
h = 0.1
b = 0.055
s = 0.0041
t = 0.0057
r = 0.007
RETURN


"IPE 120": 
h = 0.12
b = 0.064
s = 0.0044
t = 0.0063
r = 0.007
RETURN


"IPE 140": 
h = 0.14
b = 0.073
s = 0.0047
t = 0.0069
r = 0.007
RETURN


"IPE 160": 
h = 0.16
b = 0.082
s = 0.005
t = 0.0074
r = 0.009
RETURN


"IPE 180": 
h = 0.18
b = 0.091
s = 0.0053
t = 0.008
r = 0.009
RETURN


"IPE 200": 
h = 0.2
b = 0.1
s = 0.0056
t = 0.0085
r = 0.012
RETURN


"IPE 220": 
h = 0.22
b = 0.11
s = 0.0059
t = 0.0092
r = 0.012
RETURN


"IPE 240": 
h = 0.24
b = 0.12
s = 0.0062
t = 0.0098
r = 0.015
RETURN


"IPE 270": 
h = 0.27
b = 0.135
s = 0.0066
t = 0.0102
r = 0.015
RETURN


"IPE 300": 
h = 0.3
b = 0.15
s = 0.0071
t = 0.0107
r = 0.015
RETURN


"IPE 330": 
h = 0.33
b = 0.16
s = 0.0075
t = 0.0115
r = 0.018
RETURN


"IPE 360": 
h = 0.36
b = 0.17
s = 0.008
t = 0.0127
r = 0.018
RETURN


"IPE 400": 
h = 0.4
b = 0.18
s = 0.0086
t = 0.0135
r = 0.021
RETURN


"IPE 450": 
h = 0.45
b = 0.19
s = 0.0094
t = 0.0146
r = 0.021
RETURN


"IPE 500": 
h = 0.5
b = 0.2
s = 0.0102
t = 0.016
r = 0.021
RETURN


"IPE 550": 
h = 0.55
b = 0.21
s = 0.0111
t = 0.0172
r = 0.024
RETURN


"IPE 600": 
h = 0.6
b = 0.22
s = 0.012
t = 0.019
r = 0.024
RETURN


"IPEo 180": 
h = 0.182
b = 0.092
s = 0.006
t = 0.009
r = 0.009
RETURN


"IPEo 200": 
h = 0.202
b = 0.102
s = 0.0062
t = 0.0095
r = 0.012
RETURN


"IPEo 220": 
h = 0.222
b = 0.112
s = 0.0066
t = 0.01
r = 0.012
RETURN


"IPEo 240": 
h = 0.242
b = 0.122
s = 0.007
t = 0.01
r = 0.015
RETURN


"IPEo 270": 
h = 0.274
b = 0.136
s = 0.0075
t = 0.012
r = 0.015
RETURN


"IPEo 300": 
h = 0.304
b = 0.152
s = 0.008
t = 0.012
r = 0.015
RETURN


"IPEo 330": 
h = 0.334
b = 0.162
s = 0.0085
t = 0.013
r = 0.018
RETURN


"IPEo 360": 
h = 0.364
b = 0.172
s = 0.0092
t = 0.014
r = 0.018
RETURN


"IPEo 400": 
h = 0.404
b = 0.182
s = 0.0097
t = 0.015
r = 0.021
RETURN


"IPEv 400": 
h = 0.408
b = 0.182
s = 0.01
t = 0.017
r = 0.021
RETURN


"IPEo 450": 
h = 0.456
b = 0.192
s = 0.011
t = 0.017
r = 0.021
RETURN


"IPEv 450": 
h = 0.46
b = 0.194
s = 0.012
t = 0.019
r = 0.021
RETURN


"IPEo 500": 
h = 0.506
b = 0.202
s = 0.012
t = 0.019
r = 0.021
RETURN


"IPEv 500": 
h = 0.514
b = 0.204
s = 0.014
t = 0.023
r = 0.021
RETURN


"IPEo 550": 
h = 0.556
b = 0.212
s = 0.012
t = 0.02
r = 0.024
RETURN


"IPEv 550": 
h = 0.566
b = 0.216
s = 0.017
t = 0.025
r = 0.024
RETURN


"IPEo 600": 
h = 0.61
b = 0.224
s = 0.015
t = 0.024
r = 0.024
RETURN


"IPEv 600": 
h = 0.618
b = 0.228
s = 0.018
t = 0.028
r = 0.024
RETURN


]]></Text></Part3D><PartDialog><Enable>1</Enable><Text><![CDATA[txt_width = 160 
columnsize = txt_width + 24 
controlwidth = 124 
controlheight = 22 
row = 0 
rowsize = 25 


I_DIALOG `IPE` 

I_PAGE `IPE - mittelbreite I-Träger` 


I_OUTFIELD `Profil` , 0 , row * rowsize , txt_width , controlheight , 1 
I_INFIELD "profile_name" , columnsize , row * rowsize , controlwidth , controlheight 
row = row + 1 

I_OUTFIELD `Rundungen darstellen` , 0 , row * rowsize , txt_width , controlheight , 1 
I_INFIELD "rounded" , columnsize , row * rowsize , controlwidth , controlheight 
row = row + 1 

I_OUTFIELD `halbierter Träger` , 0 , row * rowsize , txt_width , controlheight , 1 
I_INFIELD "half_beam" , columnsize , row * rowsize , controlwidth , controlheight 
row = row + 1 

I_OUTFIELD `Länge` , 0 , row * rowsize , txt_width , controlheight , 1 
I_INFIELD "ref_z" , columnsize , row * rowsize , controlwidth , controlheight 
row = row + 1 

row = row + 1.5 
I_OUTFIELD `(C) 2012 Manfred Moitzi, smartparts.tzb-moitzi.at` , 0 , row * rowsize , txt_width * 2 , controlheight , 2 
row = row + 1 
I_OUTFIELD `Lizenz: GNU General Public License (GPLv3), www.fsf.org` , 0 , row * rowsize , txt_width * 2 , controlheight , 2 ]]></Text></PartDialog></Script><Drawing2D/><Drawing3D/><Pictures><ImportBitmaps>0</ImportBitmaps></Pictures></ScriptObject>