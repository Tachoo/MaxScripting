--Laptop 
--openlog "C:/Users/Lord Tacho/Documents/ProgramacionMaxScript/Git/MaxScripting/AnguloRosalesSergioAnastacio_P3D_A8.txt" mode:"a"

--Desktop
openlog "E:/ICloud_Dropbox/Dropbox/UNIAT Univercidad/MaxScripting\MaxScripting/AnguloRosalesSergioAnastacio_P3D_A8.txt" mode:"a"

fn RevScacala objetos=
	(
	objectG=#();
	nogeo=#();
	is=0;
	cs=0;		
	
		for j in objetos where(superclassof == geometryclass)do
		(
			append objectG j;
			if(objectG.count >0 and objetos != undefined)then
			(
				for i in objectG do
					(
					if(i.scale!=[1,1,1]) then (i.wirecolor = red; is+=1)else(i.wirecolor=green; cs+=1)
					 )
			)
		)
		
		for a in objetos where( superclassof a!=geometryclass  ) do append(NeoGeo a)
		format "No.Objetos\t/t No.Objetos/2\2correctos\2\2incorrectos\n"
		format "%\2\2\2\2%\2\2\2\2%\2\2\2\2%\n" objects.count (objectG.count)(nogeo.count) cs is 
		
	)
	
fn CreaNTeteras NumeroTeteras=
	(
		
	colores=#(red,green,blue,yellow);
    posT=#();		
	for i=1 to NumeroTeteras do
		(
			(if (NumeroTeteras >4)then(append colores (random red yellow))); teapot  wirecolor: colores[i];
				append posT([objects[i].wirecolor.r/10,Objects[i].wirecolor.g/10,Objects[i].wirecolor.b/10])
				
				if(Objects[i].wirecolor==red or Objects[i].wirecolor==blue)then(Objects[i].radius=10)
				if(Objects[i].wirecolor==green or Objects[i].wirecolor==yellow)then(Objects[i].radius=5)
								if(Objects[i].wirecolor!=colores[i])then(Objects[i].radius=2.5 objects[i].pos=posT[i];)
				
		)
		
		
		
		
		
	)	
	
fn LPHP objetos=
	(
		objs=#();
		objg=#();
		struct infoG(Ncaras,Nombre,Ocolor);
		for j in objetos where(superclassof j==geometryclass)do(append objg j)
		if(objg.count >0 and objetos !=undefined)then
		(
			nc=#()
			no=#()
			co=#()
			for i=1 to selection.count where(superclassof selection[i]==geometryclass)do
			(
			append NC ((getPolygonCount selection[i][1]); append NO(Selection[i].name); append CO(selection[i].wirecolor))
			obje=infoG Ncaras:NC Nombre:NO Ocolor:CO
				
			HP=finditem obje.Ncaras(amax obje.NCaras)
			instanceHP=(execute("instance"+"$"+obje.Nombre[hp]))
			instancehp.pos=[0,0,0]; instancehp.name=instancehp.name+"hp"
					
			LP=finditem obje.Ncaras(amin obje.NCaras)
			instanceLP=(execute("instance"+"$"+obje.Nombre[lp]))
			instancelp.pos=[0,0,0]; instancehp.name=instancehp.name+"lp"
			)
		for i in objetos where(superclassof i !=geometryclass)do(append objs((superclassof i)as string))
			format"Tipos de objetos: "
			for j=1 to objs.count do(format "%" (objs[j]) );
			format "Cantidad de objetos que no son geometrias" (objs.count) as string
			)
			CAT=#(hp,lp)
			catins=#(instancehp.name,instancelp.name);
			format "#obj clasifi \t\t Nombre original\t\t Wirecolor original\t\t Conteo de caras \t\t Nombre actual \t\t\t"
			for i=1 to cat.count do
				(
					(cat[i] obje.nombre[cat[i]] obje.ocolor[cat[i]] obje.Ncaras[cat[i]] catins[i]);
				)
	)	
	
	-- HACER LA FUNCION QUE SE LLAME CLASIOBJ Y RECIBA OBJETOS
--DEBE ASEGURARSE DE QUE LE PASEN OBJETOS.
-- QUE REVISE TODOS LOS OBJETOS EN ESCENA, CLASIFIQUE:
	/*
GUARDE  EL CONTEO DE OBJETOS ROJOS Y SUS NOMBRES QUE TENGAN LA ESCALA INCORRECTA 
Y QUE GUARDE EL TOTAL DE OBJETOS, SU NOMBRE Y SU COLOR DE WIRECOLOR DEL RESTO DE OBJETOS  CON LA ESCALA INCORRECTA (SIN INCLUIR LOS ROJOS CON LA ESCALA INCORRECTA) 
*/
--QUE GUARDE EL TOTAL DE OBJETOS Y SUS NOMBRES DE LOS QUE TIENEN LA ESCALA CORRECTA Y SON VERDES.
--QUE GUARDE EL TOTAL DE OBJETOS, SU NOMBRE Y SU  WIRECOLOR DEL RESTO DE OBJETOS QUE TENGA LA ESCALA CORRECTA, SIN INCLUIR LOS QUE SON VERDES.
	
fn ClassObj objetos=
(
	if(objetos!=undefined) do
	(
			--Arreglo donde sabremos si la cosa que nos paso es un objeto
			RObj=#();
			--Estructura donde guardaaremos las cosas
			struct BadScale(NOBJ,NOMBRE,WCOLOR);
			--Estructura de las escalss correctas
			struct GoodScale(NOBJ,NOMBRE,WCOLOR);
			
			for j in objetos where(superclassof j!= spacewarpobject)do
		    (
				append RObj j
			);
			
			if(RObj.count >0 )do
			(
				--Creamos aqui los arreglos para evitar que se creen cada vez que entra al for
				Wcolor
				for i in RObj do
					(
					if(i.scale!=[1,1,1]and i.wirecolor!=redl)
						then
						(
							/*Estan mal*/
						)
						else
						(
								/*Estan bien*/
						)
					 )
			)
			
			
	)
)
	
	
flushlog();
closelog()
