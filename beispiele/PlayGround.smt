<?xml version="1.0" encoding="UTF-8"?><ScriptObject><Version>1.0</Version><ScriptVersion>1.0</ScriptVersion><Name><![CDATA[PlayGround]]></Name><Type>1</Type><UUID>bbcd6c71-b5ce-49d0-b2af-4b4fb6a7350d</UUID><Language>de</Language><StringTable></StringTable><RelativeOrigin>0.5000000000000000 0.5000000000000000 0.5000000000000000</RelativeOrigin><AbsoluteOrigin>0.0000000000000000 0.0000000000000000 0.0000000000000000</AbsoluteOrigin><SeparateExecParts>1</SeparateExecParts><AutoPlaceResourceObjects>1</AutoPlaceResourceObjects><Scale>1</Scale><Use3DPreview>0</Use3DPreview><IsLocked>0</IsLocked><IsEncrypted>0</IsEncrypted><Key><![CDATA[]]></Key><CalledMacros></CalledMacros><Parameters><Type>1</Type><MapPenToColor>0</MapPenToColor><Parameter><Identifier>ref_x</Identifier><Name><![CDATA[X-Abmessung]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>1</SystemID><CurrentValue><Value><Type>6</Type><StringValue></StringValue><DoubleValue>10.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_y</Identifier><Name><![CDATA[Y-Abmessung]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>2</SystemID><CurrentValue><Value><Type>6</Type><StringValue></StringValue><DoubleValue>10.000000000000</DoubleValue></Value></CurrentValue></Parameter><Parameter><Identifier>ref_z</Identifier><Name><![CDATA[Z-Abmessung]]></Name><Group><![CDATA[]]></Group><Type>1</Type><Attribute>-1</Attribute><SystemID>3</SystemID><CurrentValue><Value><Type>6</Type><StringValue></StringValue><DoubleValue>10.000000000000</DoubleValue></Value></CurrentValue></Parameter></Parameters><Script><PartParameter><Enable>1</Enable><Text><![CDATA[]]></Text></PartParameter><PartMaster><Enable>1</Enable><Text><![CDATA[]]></Text></PartMaster><Part2D>><Enable>1</Enable><Text><![CDATA[]]></Text></Part2D><Part3D><Enable>1</Enable><Text><![CDATA[GOSUB "draw_axis" 
COLOR -1 

! Hier Code-Schnipsel testen

END 

"draw_axis": 

!X-Axis
COLOR 6 
LINE 0 , 0 , 0 , 10 , 0 , 0 

!Y-Axis
COLOR 4 
LINE 0 , 0 , 0 , 0 , 10 , 0 

!Z-Axis
COLOR 7 
LINE 0 , 0 , 0 , 0 , 0 , 10 

!Raster
COLOR 25 
FOR i = 1 TO 10 
   LINE 0 , i , 0 , 10 , i , 0 
   LINE i , 0 , 0 , i , 10 , 0 
   LINE i , 0 , 0 , i , 0 , 10 
   LINE 0 , i , 0 , 0 , i , 10 
   LINE 0 , 0 , i , 10 , 0 , i 
   LINE 0 , 0 , i , 0 , 10 , i 
NEXT i 
RETURN ]]></Text></Part3D><PartDialog><Enable>1</Enable><Text><![CDATA[]]></Text></PartDialog></Script><Drawing2D></Drawing2D><Drawing3D></Drawing3D><Pictures><ImportBitmaps>0</ImportBitmaps></Pictures></ScriptObject>