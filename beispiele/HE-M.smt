<?xml version="1.0" encoding="UTF-8"?><ScriptObject><Version>1.0</Version><ScriptVersion>1.0</ScriptVersion><Name><![CDATA[HE-M]]></Name><Type>1</Type><UUID>bbcd6c71-b5ce-49d0-b2af-4b4fb6a7350d</UUID><Language>de</Language><StringTable/><RelativeOrigin>0.0000000000000000 0.5000000000000000 0.5000000000000000</RelativeOrigin><AbsoluteOrigin>0.0000000000000000 0.0000000000000000 0.0000000000000000</AbsoluteOrigin><SeparateExecParts>1</SeparateExecParts><AutoPlaceResourceObjects>1</AutoPlaceResourceObjects><Scale>1</Scale><Use3DPreview>0</Use3DPreview><IsLocked>0</IsLocked><IsEncrypted>0</IsEncrypted><Key><![CDATA[]]></Key><CalledMacros/><Parameters><Type>1</Type><MapPenToColor>0</MapPenToColor><Parameter><Identifier>half_beam</Identifier><Name><![CDATA[halber Träger]]></Name><Group><![CDATA[]]></Group><Type>4</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>4</Type><StringValue/><DoubleValue>0.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>profile_name</Identifier><Name><![CDATA[Profilname]]></Name><Group><![CDATA[]]></Group><Type>3</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>3</Type><StringValue><![CDATA[HX 1000 M]]></StringValue><DoubleValue>0.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_x</Identifier><Name><![CDATA[Breite]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>1</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>0.453000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_y</Identifier><Name><![CDATA[Höhe]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>2</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>1.008000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_z</Identifier><Name><![CDATA[Länge]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>3</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>1.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>rounded</Identifier><Name><![CDATA[Rundungen darstellen]]></Name><Group><![CDATA[]]></Group><Type>4</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>4</Type><StringValue/><DoubleValue>1.000000000000</DoubleValue></Value></CurrentValue></Parameter></Parameters><Script><PartParameter><Enable>1</Enable><Text><![CDATA[!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org

VALUES "profile_name" "HE-M 100" , "HE-M 120" , "HE-M 140" , "HE-M 160" , "HE-M 180" , 
"HE-M 200" , "HE-M 220" , "HE-M 240" , "HE-M 260" , "HE-M 280" , 
"HE-M 300" , "HE-M 305", "HE-M 320" , "HE-M 340", "HE-M 360" , 
"HE-M 400" , "HE-M 450" , "HE-M 500" , "HE-M 550" , "HE-M 600" ,
"HE-M 650" , "HE-M 700" , "HE-M 800" , "HE-M 900" , 
"HE-M 1000" , "HL 1000 M" , "HX 1000 M"
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






"HE-M 100": 
h = 0.12
b = 0.106
s = 0.012
t = 0.02
r = 0.012
RETURN


"HE-M 120": 
h = 0.14
b = 0.126
s = 0.0125
t = 0.021
r = 0.012
RETURN


"HE-M 140": 
h = 0.16
b = 0.146
s = 0.013
t = 0.022
r = 0.012
RETURN


"HE-M 160": 
h = 0.18
b = 0.166
s = 0.014
t = 0.023
r = 0.015
RETURN


"HE-M 180": 
h = 0.2
b = 0.186
s = 0.0145
t = 0.024
r = 0.015
RETURN


"HE-M 200": 
h = 0.22
b = 0.206
s = 0.015
t = 0.025
r = 0.018
RETURN


"HE-M 220": 
h = 0.24
b = 0.226
s = 0.0155
t = 0.026
r = 0.018
RETURN


"HE-M 240": 
h = 0.27
b = 0.248
s = 0.018
t = 0.032
r = 0.021
RETURN


"HE-M 260": 
h = 0.29
b = 0.268
s = 0.018
t = 0.0325
r = 0.024
RETURN


"HE-M 280": 
h = 0.31
b = 0.288
s = 0.0185
t = 0.033
r = 0.024
RETURN


"HE-M 300": 
h = 0.34
b = 0.31
s = 0.021
t = 0.039
r = 0.027
RETURN


"HE-M 305": 
h = 0.32
b = 0.305
s = 0.016
t = 0.029
r = 0.027
RETURN


"HE-M 320": 
h = 0.359
b = 0.309
s = 0.021
t = 0.04
r = 0.027
RETURN


"HE-M 340": 
h = 0.377
b = 0.309
s = 0.021
t = 0.04
r = 0.027
RETURN


"HE-M 360": 
h = 0.395
b = 0.308
s = 0.021
t = 0.04
r = 0.027
RETURN


"HE-M 400": 
h = 0.432
b = 0.307
s = 0.021
t = 0.04
r = 0.027
RETURN


"HE-M 450": 
h = 0.478
b = 0.307
s = 0.021
t = 0.04
r = 0.027
RETURN


"HE-M 500": 
h = 0.524
b = 0.306
s = 0.021
t = 0.04
r = 0.027
RETURN


"HE-M 550": 
h = 0.572
b = 0.306
s = 0.021
t = 0.04
r = 0.027
RETURN


"HE-M 600": 
h = 0.62
b = 0.305
s = 0.021
t = 0.04
r = 0.027
RETURN


"HE-M 650": 
h = 0.668
b = 0.305
s = 0.021
t = 0.04
r = 0.027
RETURN


"HE-M 700": 
h = 0.716
b = 0.304
s = 0.021
t = 0.04
r = 0.027
RETURN


"HE-M 800": 
h = 0.814
b = 0.303
s = 0.021
t = 0.04
r = 0.03
RETURN


"HE-M 900": 
h = 0.91
b = 0.302
s = 0.021
t = 0.04
r = 0.03
RETURN


"HE-M 1000": 
h = 1.008
b = 0.302
s = 0.021
t = 0.04
r = 0.03
RETURN


"HL 1000 M": 
h = 1.008
b = 0.402
s = 0.021
t = 0.04
r = 0.03
RETURN


"HX 1000 M": 
h = 1.008
b = 0.453
s = 0.021
t = 0.04
r = 0.03
RETURN



]]></Text></Part3D><PartDialog><Enable>1</Enable><Text><![CDATA[txt_width = 160 
columnsize = txt_width + 24 
controlwidth = 124 
controlheight = 22 
row = 0 
rowsize = 25 


I_DIALOG `HE-M` 

I_PAGE `HE-M (IPBv) - breite I-Träger, verstärkte Ausführung` 


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