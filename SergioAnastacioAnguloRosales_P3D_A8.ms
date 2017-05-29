openlog "C:/Users/Lord Tacho/Documents/ProgramacionMaxScript/Git/MaxScriptingAnguloRosalesSergioAnastacio_P3D_A8.txt" mode:"a"


fn RevScacala objetos=
	(
	obj=#();
	nogeo=#();
	is=#();
	cs=#();		
	
		for j in objetos where(superclassof == geometryclass)do
		(
			append obj j;
			if(obj.count >0 and objetos != undefined)then
			(
				for i n obj do
					(
					i.scale!=[1,1,1] then (i.wirecolor = red; is+=1)else(i.wirecolor=green; cs+=1)
					 )
			)
		)
		
		for a in objetos where( superclassof a!=geometryclass  ) do append(NeoGeo a)
		format "No.Objetos\2\2 No.Objetos\2\2correctos\2\2incorrectos\n"
		format "%\2\2\2\2%\2\2\2\2%\2\2\2\2%\n" objects.count (objectG.count)(nogeo.count) cs is 
		
	)
	
	
flushlog();
closelog()
