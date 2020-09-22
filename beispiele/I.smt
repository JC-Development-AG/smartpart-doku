<?xml version="1.0" encoding="UTF-8"?><ScriptObject><Version>1.0</Version><ScriptVersion>1.0</ScriptVersion><Name><![CDATA[I]]></Name><Type>1</Type><UUID>bbcd6c71-b5ce-49d0-b2af-4b4fb6a7350d</UUID><Language>de</Language><StringTable/><RelativeOrigin>0.0000000000000000 0.5000000000000000 0.5000000000000000</RelativeOrigin><AbsoluteOrigin>0.0000000000000000 0.0000000000000000 0.0000000000000000</AbsoluteOrigin><SeparateExecParts>1</SeparateExecParts><AutoPlaceResourceObjects>1</AutoPlaceResourceObjects><Scale>1</Scale><Use3DPreview>0</Use3DPreview><IsLocked>0</IsLocked><IsEncrypted>0</IsEncrypted><Key><![CDATA[]]></Key><CalledMacros/><Parameters><Type>1</Type><MapPenToColor>0</MapPenToColor><Parameter><Identifier>half_beam</Identifier><Name><![CDATA[halber Träger]]></Name><Group><![CDATA[]]></Group><Type>4</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>4</Type><StringValue/><DoubleValue>0.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>profile_name</Identifier><Name><![CDATA[Profilname]]></Name><Group><![CDATA[]]></Group><Type>3</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>3</Type><StringValue><![CDATA[I 400]]></StringValue><DoubleValue>0.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_x</Identifier><Name><![CDATA[Breite]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>1</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>0.155000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_y</Identifier><Name><![CDATA[Höhe]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>2</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>0.400000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_z</Identifier><Name><![CDATA[Länge]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>3</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>1.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>rounded</Identifier><Name><![CDATA[Rundung darstellen]]></Name><Group><![CDATA[]]></Group><Type>4</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>1</Type><StringValue/><DoubleValue>1.000000000000</DoubleValue></Value></CurrentValue></Parameter></Parameters><Script><PartParameter><Enable>1</Enable><Text><![CDATA[!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org

VALUES "profile_name" "I 80" , "I 100" , "I 120" , "I 140" , "I 160" , "I 180" , 
"I 200" , "I 220" , "I 240" , "I 260" , "I 280" , 
"I 300" , "I 320" , "I 340" , "I 360" , "I 380" , 
"I 400" , "I 450" , "I 500" , "I 550" 

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
	

! beam_with_inclining_flange
inclination = 0.14 ! 14%
alpha = 90 - ATAN ( inclination )

c1 = b / 4 - r2 
t1 = t - c1 * 0.14 - r2 / COS ( 90 - alpha ) 
c2 = b / 4 - s / 2 - r + r * COS ( alpha ) 
rounding2_start_x = b / 4 - c2 
rounding2_start_y = t + c2 * inclination

GROUP quater_1
PRISM_ 9 , REF_Z , 
0 , 0 , 0 , 
b / 2 , 0 , 0 , 
0 , t1 , 100 , 
b / 2 - r2 , t1 , 900 , 
0 , alpha , 4000 , ! 1st rounding: arc based on center point and angle

rounding2_start_x , rounding2_start_y , 0 , 
r , -alpha , 2000 , ! 2nd rounding

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






"I 80": 
h = 0.08
b = 0.042
s = 0.0039
t = 0.0059
r = 0.0039
r2 = 0.0023
RETURN


"I 100": 
h = 0.1
b = 0.05
s = 0.0045
t = 0.0068
r = 0.0045
r2 = 0.0027
RETURN


"I 120": 
h = 0.12
b = 0.058
s = 0.0051
t = 0.0077
r = 0.0051
r2 = 0.0031
RETURN


"I 140": 
h = 0.14
b = 0.066
s = 0.0057
t = 0.0086
r = 0.0057
r2 = 0.0034
RETURN


"I 160": 
h = 0.16
b = 0.074
s = 0.0063
t = 0.0095
r = 0.0063
r2 = 0.0038
RETURN


"I 180": 
h = 0.18
b = 0.082
s = 0.0069
t = 0.0104
r = 0.0069
r2 = 0.0041
RETURN


"I 200": 
h = 0.2
b = 0.09
s = 0.0075
t = 0.0113
r = 0.0075
r2 = 0.0045
RETURN


"I 220": 
h = 0.22
b = 0.098
s = 0.0081
t = 0.0122
r = 0.0081
r2 = 0.0049
RETURN


"I 240": 
h = 0.24
b = 0.106
s = 0.0087
t = 0.0131
r = 0.0087
r2 = 0.0052
RETURN


"I 260": 
h = 0.26
b = 0.113
s = 0.0094
t = 0.0141
r = 0.0094
r2 = 0.0056
RETURN


"I 280": 
h = 0.29
b = 0.119
s = 0.0101
t = 0.0152
r = 0.0101
r2 = 0.0061
RETURN


"I 300": 
h = 0.3
b = 0.125
s = 0.0108
t = 0.0162
r = 0.0108
r2 = 0.0065
RETURN


"I 320": 
h = 0.32
b = 0.131
s = 0.0115
t = 0.0173
r = 0.0115
r2 = 0.0069
RETURN


"I 340": 
h = 0.34
b = 0.137
s = 0.0122
t = 0.0183
r = 0.0122
r2 = 0.0073
RETURN


"I 360": 
h = 0.36
b = 0.143
s = 0.013
t = 0.0195
r = 0.013
r2 = 0.0078
RETURN


"I 380": 
h = 0.38
b = 0.149
s = 0.0137
t = 0.0205
r = 0.0137
r2 = 0.0082
RETURN


"I 400": 
h = 0.4
b = 0.155
s = 0.0144
t = 0.0216
r = 0.0144
r2 = 0.0086
RETURN


"I 450": 
h = 0.45
b = 0.17
s = 0.0162
t = 0.0243
r = 0.0162
r2 = 0.0097
RETURN


"I 500": 
h = 0.5
b = 0.185
s = 0.018
t = 0.027
r = 0.018
r2 = 0.0108
RETURN


"I 550": 
h = 0.55
b = 0.2
s = 0.019
t = 0.03
r = 0.019
r2 = 0.0119
RETURN



]]></Text></Part3D><PartDialog><Enable>1</Enable><Text><![CDATA[txt_width = 160 
columnsize = txt_width + 24 
controlwidth = 124 
controlheight = 22 
row = 0 
rowsize = 25 


I_DIALOG `I` 

I_PAGE `I - schmale I-Träger` 


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