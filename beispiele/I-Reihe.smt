<?xml version="1.0" encoding="UTF-8"?><ScriptObject><Version>1.0</Version><ScriptVersion>1.0</ScriptVersion><Name><![CDATA[I-Reihe]]></Name><Type>1</Type><UUID>bbcd6c71-b5ce-49d0-b2af-4b4fb6a7350d</UUID><Language>de</Language><StringTable/><RelativeOrigin>0.0000000000000000 0.5000000000000000 0.5000000000000000</RelativeOrigin><AbsoluteOrigin>0.0000000000000000 0.0000000000000000 0.0000000000000000</AbsoluteOrigin><SeparateExecParts>1</SeparateExecParts><AutoPlaceResourceObjects>1</AutoPlaceResourceObjects><Scale>1</Scale><Use3DPreview>0</Use3DPreview><IsLocked>0</IsLocked><IsEncrypted>0</IsEncrypted><Key><![CDATA[]]></Key><CalledMacros/><Parameters><Type>1</Type><MapPenToColor>0</MapPenToColor><Parameter><Identifier>beam_type</Identifier><Name><![CDATA[Trägertyp]]></Name><Group><![CDATA[]]></Group><Type>3</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>3</Type><StringValue><![CDATA[HE-A]]></StringValue><DoubleValue>0.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>half_beam</Identifier><Name><![CDATA[halber Träger]]></Name><Group><![CDATA[]]></Group><Type>4</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>0.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>profile_name</Identifier><Name><![CDATA[Profilname]]></Name><Group><![CDATA[]]></Group><Type>3</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>3</Type><StringValue><![CDATA[HE-A 300]]></StringValue><DoubleValue>0.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_x</Identifier><Name><![CDATA[Breite]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>1</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>0.300000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_y</Identifier><Name><![CDATA[Höhe]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>2</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>0.290000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_z</Identifier><Name><![CDATA[Länge]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>3</SystemID><CurrentValue><Value><Type>6</Type><StringValue/><DoubleValue>1.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>rounded</Identifier><Name><![CDATA[Rundung darstellen]]></Name><Group><![CDATA[]]></Group><Type>4</Type><Attribute>-1</Attribute><SystemID>0</SystemID><CurrentValue><Value><Type>4</Type><StringValue/><DoubleValue>1.000000000000</DoubleValue></Value></CurrentValue></Parameter></Parameters><Script><PartParameter><Enable>1</Enable><Text><![CDATA[!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org

VALUES "beam_type" "I" , "IPE" , "HE-A" , "HE-B" , "HE-M" 

IF beam_type = "I" THEN 
!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org

VALUES "profile_name" "I 80" , "I 100" , "I 120" , "I 140" , "I 160" , "I 180" , 
"I 200" , "I 220" , "I 240" , "I 260" , "I 280" , 
"I 300" , "I 320" , "I 340" , "I 360" , "I 380" , 
"I 400" , "I 450" , "I 500" , "I 550" 


ENDIF 

IF beam_type = "IPE" THEN 
!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org

VALUES "profile_name" "IPE 80" , "IPE 100" , "IPE 120" , "IPE 140" , 
"IPE 160" , "IPE 180" , "IPE 200" , "IPE 220" , "IPE 240" , "IPE 270" , 
"IPE 300" , "IPE 330" , "IPE 360" , "IPE 400" , "IPE 450" , "IPE 500" , 
"IPE 550" , "IPE 600" , 
"IPEo 180" , "IPEo 200" , "IPEo 220" , "IPEo 240" , "IPEo 270", "IPEo 300" ,
"IPEo 330" , "IPEo 360" , "IPEo 400" , "IPEv 400" , "IPEo 450", "IPEv 450" ,
"IPEo 500" , "IPEv 500" , "IPEo 550" , "IPEv 550" , "IPEo 600", "IPEv 600"


ENDIF 

IF beam_type = "HE-A" THEN 
!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org

VALUES "profile_name" "HE-A 100" , "HE-A 120" , "HE-A 140" , "HE-A 160" , "HE-A 180" , 
"HE-A 200" , "HE-A 220" , "HE-A 240" , "HE-A 260" , "HE-A 280" , 
"HE-A 300" , "HE-A 320" , "HE-A 340", "HE-A 360" , 
"HE-A 400" , "HE-A 450" , "HE-A 500" , "HE-A 550" , "HE-A 600" ,
"HE-A 650" , "HE-A 700" , "HE-A 800" , "HE-A 900" , 
"HE-A 1000" , "HL 1000 A" , "HX 1000 A"

ENDIF 

IF beam_type = "HE-B" THEN 
!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org

VALUES "profile_name" "HE-B 100" , "HE-B 120" , "HE-B 140" , "HE-B 160" , "HE-B 180" , 
"HE-B 200" , "HE-B 220" , "HE-B 240" , "HE-B 260" , "HE-B 280" , 
"HE-B 300" , "HE-B 320" , "HE-B 340", "HE-B 360" , 
"HE-B 400" , "HE-B 450" , "HE-B 500" , "HE-B 550" , "HE-B 600" ,
"HE-B 650" , "HE-B 700" , "HE-B 800" , "HE-B 900" , 
"HE-B 1000" , "HL 1000 B" , "HX 1000 B"

ENDIF 

IF beam_type = "HE-M" THEN 
!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org

VALUES "profile_name" "HE-M 100" , "HE-M 120" , "HE-M 140" , "HE-M 160" , "HE-M 180" , 
"HE-M 200" , "HE-M 220" , "HE-M 240" , "HE-M 260" , "HE-M 280" , 
"HE-M 300" , "HE-M 305", "HE-M 320" , "HE-M 340", "HE-M 360" , 
"HE-M 400" , "HE-M 450" , "HE-M 500" , "HE-M 550" , "HE-M 600" ,
"HE-M 650" , "HE-M 700" , "HE-M 800" , "HE-M 900" , 
"HE-M 1000" , "HL 1000 M" , "HX 1000 M"

ENDIF ]]></Text></PartParameter><PartMaster><Enable>0</Enable><Text><![CDATA[]]></Text></PartMaster><Part2D>&gt;<Enable>0</Enable><Text><![CDATA[]]></Text></Part2D><Part3D><Enable>1</Enable><Text><![CDATA[!(C) 2012, Manfred Moitzi, smartparts.tzb-moitzi.at
!License: General Public License (GPLv3), www.fsf.org

! global profile data - don not touch
! -----------------------------------
! h ... height of beam
! b ... width of beam
! s ... thickness of beam web 
! t ... thickness of flange
! r ... corner radius
! r2... corner radius2 only "I-Profil"



GOSUB profile_name ! setup profile data (h, b, s, t, r)

!create_handles: beam length handle for ref_z
HANDLE 0 , 0 , 0 , 1 , "ref_z" , 1 
HANDLE 0 , 0 , REF_Z , 1 , "ref_z" , 2 
HANDLE 0 , 0 , -1 , 1 , "ref_z" , 3 
! set reference box parameters
PARAMETERS REF_X = b , REF_Y = h 
! end of create_handles


! Beam is double symmetric
! Create one quater and mirror-copy the rest
IF rounded THEN 
   IF beam_type = "I" THEN 
      
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

   ELSE 
      
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

   ENDIF    
ELSE 
   
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

! -------------------------------------------
! ----------  PROFILE DATA SECTION ----------
! -------------------------------------------



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




"HE-A 100": 
h = 0.096
b = 0.1
s = 0.005
t = 0.008
r = 0.012
RETURN


"HE-A 120": 
h = 0.114
b = 0.12
s = 0.005
t = 0.008
r = 0.012
RETURN


"HE-A 140": 
h = 0.133
b = 0.14
s = 0.0055
t = 0.0085
r = 0.012
RETURN


"HE-A 160": 
h = 0.152
b = 0.16
s = 0.006
t = 0.009
r = 0.015
RETURN


"HE-A 180": 
h = 0.171
b = 0.18
s = 0.006
t = 0.0095
r = 0.015
RETURN


"HE-A 200": 
h = 0.19
b = 0.2
s = 0.0065
t = 0.01
r = 0.018
RETURN


"HE-A 220": 
h = 0.21
b = 0.22
s = 0.007
t = 0.011
r = 0.018
RETURN


"HE-A 240": 
h = 0.23
b = 0.24
s = 0.0075
t = 0.012
r = 0.021
RETURN


"HE-A 260": 
h = 0.25
b = 0.26
s = 0.0075
t = 0.0125
r = 0.024
RETURN


"HE-A 280": 
h = 0.27
b = 0.28
s = 0.008
t = 0.013
r = 0.024
RETURN


"HE-A 300": 
h = 0.29
b = 0.3
s = 0.0085
t = 0.014
r = 0.027
RETURN


"HE-A 320": 
h = 0.31
b = 0.3
s = 0.009
t = 0.0155
r = 0.027
RETURN


"HE-A 340": 
h = 0.33
b = 0.3
s = 0.0095
t = 0.0165
r = 0.027
RETURN


"HE-A 360": 
h = 0.35
b = 0.3
s = 0.01
t = 0.0175
r = 0.027
RETURN


"HE-A 400": 
h = 0.39
b = 0.3
s = 0.011
t = 0.019
r = 0.027
RETURN


"HE-A 450": 
h = 0.44
b = 0.3
s = 0.0115
t = 0.021
r = 0.027
RETURN


"HE-A 500": 
h = 0.49
b = 0.3
s = 0.012
t = 0.023
r = 0.027
RETURN


"HE-A 550": 
h = 0.54
b = 0.3
s = 0.0125
t = 0.024
r = 0.027
RETURN


"HE-A 600": 
h = 0.59
b = 0.3
s = 0.013
t = 0.025
r = 0.027
RETURN


"HE-A 650": 
h = 0.64
b = 0.3
s = 0.0135
t = 0.026
r = 0.027
RETURN


"HE-A 700": 
h = 0.69
b = 0.3
s = 0.0145
t = 0.027
r = 0.027
RETURN


"HE-A 800": 
h = 0.79
b = 0.3
s = 0.015
t = 0.028
r = 0.03
RETURN


"HE-A 900": 
h = 0.89
b = 0.3
s = 0.016
t = 0.03
r = 0.03
RETURN


"HE-A 1000": 
h = 0.99
b = 0.3
s = 0.0165
t = 0.021
r = 0.03
RETURN


"HL 1000 A": 
h = 0.99
b = 0.4
s = 0.0165
t = 0.031
r = 0.03
RETURN


"HX 1000 A": 
h = 0.992
b = 0.45
s = 0.018
t = 0.032
r = 0.03
RETURN





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


I_DIALOG `I-Reihe` 

I_PAGE `I-Reihe` 

I_OUTFIELD `Trägertyp` , 0 , row * rowsize , txt_width , controlheight , 1 
I_INFIELD "beam_type" , columnsize , row * rowsize , controlwidth , controlheight 
row = row + 1 


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