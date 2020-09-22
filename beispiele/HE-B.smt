<?xml version="1.0" encoding="UTF-8"?><ScriptObject><Version>1.0</Version><ScriptVersion>1.0</ScriptVersion><Name><![CDATA[HE-B]]></Name><Type>1</Type><UUID>bbcd6c71-b5ce-49d0-b2af-4b4fb6a7350d</UUID><Language>de</Language><StringTable/><RelativeOrigin>0.0000000000000000 0.5000000000000000 0.5000000000000000</RelativeOrigin><AbsoluteOrigin>0.0000000000000000 0.0000000000000000 0.0000000000000000</AbsoluteOrigin><SeparateExecParts>1</SeparateExecParts><AutoPlaceResourceObjects>1</AutoPlaceResourceObjects><Scale>1</Scale><Use3DPreview>0</Use3DPreview><IsLocked>0</IsLocked><IsEncrypted>0</IsEncrypted><Key><![CDATA[]]></Key><CalledMacros/><Parameters><Type>1</Type><MapPenToColor>0</MapPenToColor><Parameter><Identifier>half_beam</Identifier><Name><![CDATA[halber Träger]]></Name><Group><![CDATA[]]></Group><Type>4</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>0.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>profile_name</Identifier><Name><![CDATA[Profilname]]></Name><Group><![CDATA[]]></Group><Type>3</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>3</Type><StringValue><![CDATA[HE-B 1000]]></StringValue><DoubleValue>0.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_x</Identifier><Name><![CDATA[Breite]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>1</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>0.300000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_y</Identifier><Name><![CDATA[Höhe]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>2</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>1.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_z</Identifier><Name><![CDATA[Länge]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>3</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>1.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>rounded</Identifier><Name><![CDATA[Rundungen darstellen]]></Name><Group><![CDATA[]]></Group><Type>4</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>4</Type><StringValue/><DoubleValue>1.000000000000</DoubleValue></Value></CurrentValue></Parameter></Parameters><Script><PartParameter><Enable>1</Enable><Text><![CDATA[!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org

VALUES "profile_name" "HE-B 100" , "HE-B 120" , "HE-B 140" , "HE-B 160" , "HE-B 180" , 
"HE-B 200" , "HE-B 220" , "HE-B 240" , "HE-B 260" , "HE-B 280" , 
"HE-B 300" , "HE-B 320" , "HE-B 340", "HE-B 360" , 
"HE-B 400" , "HE-B 450" , "HE-B 500" , "HE-B 550" , "HE-B 600" ,
"HE-B 650" , "HE-B 700" , "HE-B 800" , "HE-B 900" , 
"HE-B 1000" , "HL 1000 B" , "HX 1000 B"
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






"HE-B 100": 
h = 0.1
b = 0.1
s = 0.006
t = 0.01
r = 0.012
RETURN


"HE-B 120": 
h = 0.12
b = 0.12
s = 0.0065
t = 0.011
r = 0.012
RETURN


"HE-B 140": 
h = 0.14
b = 0.14
s = 0.007
t = 0.012
r = 0.012
RETURN


"HE-B 160": 
h = 0.16
b = 0.16
s = 0.008
t = 0.013
r = 0.015
RETURN


"HE-B 180": 
h = 0.18
b = 0.18
s = 0.0085
t = 0.014
r = 0.015
RETURN


"HE-B 200": 
h = 0.2
b = 0.2
s = 0.009
t = 0.015
r = 0.018
RETURN


"HE-B 220": 
h = 0.22
b = 0.22
s = 0.0095
t = 0.016
r = 0.018
RETURN


"HE-B 240": 
h = 0.24
b = 0.24
s = 0.01
t = 0.017
r = 0.021
RETURN


"HE-B 260": 
h = 0.26
b = 0.26
s = 0.01
t = 0.0175
r = 0.024
RETURN


"HE-B 280": 
h = 0.28
b = 0.28
s = 0.0105
t = 0.018
r = 0.024
RETURN


"HE-B 300": 
h = 0.3
b = 0.3
s = 0.011
t = 0.0205
r = 0.027
RETURN


"HE-B 320": 
h = 0.32
b = 0.3
s = 0.0115
t = 0.0205
r = 0.027
RETURN


"HE-B 340": 
h = 0.34
b = 0.3
s = 0.012
t = 0.0215
r = 0.027
RETURN


"HE-B 360": 
h = 0.36
b = 0.3
s = 0.0125
t = 0.0225
r = 0.027
RETURN


"HE-B 400": 
h = 0.4
b = 0.3
s = 0.0135
t = 0.024
r = 0.027
RETURN


"HE-B 450": 
h = 0.45
b = 0.3
s = 0.014
t = 0.026
r = 0.027
RETURN


"HE-B 500": 
h = 0.5
b = 0.3
s = 0.0145
t = 0.028
r = 0.027
RETURN


"HE-B 550": 
h = 0.55
b = 0.3
s = 0.015
t = 0.029
r = 0.027
RETURN


"HE-B 600": 
h = 0.6
b = 0.3
s = 0.0155
t = 0.03
r = 0.027
RETURN


"HE-B 650": 
h = 0.65
b = 0.3
s = 0.016
t = 0.031
r = 0.027
RETURN


"HE-B 700": 
h = 0.7
b = 0.3
s = 0.017
t = 0.032
r = 0.027
RETURN


"HE-B 800": 
h = 0.8
b = 0.3
s = 0.0175
t = 0.033
r = 0.03
RETURN


"HE-B 900": 
h = 0.9
b = 0.3
s = 0.0185
t = 0.035
r = 0.03
RETURN


"HE-B 1000": 
h = 1.0
b = 0.3
s = 0.019
t = 0.036
r = 0.03
RETURN


"HL 1000 B": 
h = 1.0
b = 0.4
s = 0.019
t = 0.036
r = 0.03
RETURN


"HX 1000 B": 
h = 1.0
b = 0.451
s = 0.019
t = 0.036
r = 0.03
RETURN



]]></Text></Part3D><PartDialog><Enable>1</Enable><Text><![CDATA[txt_width = 160 
columnsize = txt_width + 24 
controlwidth = 124 
controlheight = 22 
row = 0 
rowsize = 25 


I_DIALOG `HE-B` 

I_PAGE `HE-B (IPB) - breite I-Träger (I-Breitflanschträger)` 


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