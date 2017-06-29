openlog "C:/Users/Tachoo/Documents/ProgramacionMaxScript/ANGULOSERGIO_P3D_A_29_06_17.txt" mode:"a"
-- Funcion para deletear los modificadores
--hacer una funcion que
-- guarde nombre de cada uno de los modificaores asignados a cada objeto en la scena
-- debera eliminar los modificadores de cada uno de los objetos usando los nombres que guardo como base
--pueden por ejemplo guardar un arreglo con los indices de los objetos en el arreglo mapeado de objetos de los que tengan el tipo de mofificador que esta en la primera posicion del arreglo con los nombres de los modificadores y asi sucesivamente
--despues les eliminara a los objetos indicados el modificador
--la funcion debe de tener las condiciones para asegurarse que hay objetos en la scena si no hay  pues el messae box
--si existen revisar que tengan los modificadores , los objetos sin modificadores quedaran descartados o no los tomaremos en cuenta para hacerlo de la eliminacion de modificadores 
-- tendran que poner algun parametro de entrada a la funcion 
--para que elimine todos lo smodificadores  1  y 2 para que desactive todos los modificadores  por objeto.

fn FuncionDeleteModifiers=
	(
			
		modscena=#();
		for a in objects do
			(
				--todos los objetos
				for b in a.modifiers do
					(
						--cada uno de los modificadores los a;adimos a el arreglo.
						appendifunique modscena ( (classof b)as string )
					)
			)
		-- tenemos que ver si  los objetos son compatibles  con el modificador y eliminarlo;
			for o in objects do for n=o.modifiers.count to 1 by-1 where (o.modifiers[n].name==modscena[n])do deletemodifier o n;
		-- Hacemos el enabled o disable de la vista del modificador
    		for o in geometry do for m in o.modifiers do m.enabled=false;
			
	)

    box name:"caja";
	addmodifier $caja (turbosmooth iterations: 2 );
	
	--Activa o desactiva   los modificadores (No los elimina solo cambia la forma e la que se puede ver el objeto)                             
	$caja.modifiers[1].enabled = not($caja.modifiers[1].enabled);
	
	-- For que se encarga de lo mismo  modifiers
	ts=for i=1 to objects.count where (i.modifiers.count > 1 and i.modifiers[2].name =="TurboSmooth") collect i.name
	for  i=1 to ts.count do (execute("deleteModifier"+"$"+ts[i]+"1"));
		
		$.modifiers[2].name
		$.modifiers.count>=1
		
		-- Hacemos un arreglo para guardar todos los modificadores.
		modscena=#();
		for a in objects do
			(
				--todos los objetos
				for b in a.modifiers do
					(
						--cada uno de los modificadores los a;adimos a el arreglo.
						appendifunique modscena ( (classof b)as string )
					)
			)
			
			
			$t2.baseobject=$T.baseobject
			
			--Preguntamos si existe el documento
			doesfileexist ("");
			--Salvamos el documento  : version en la que se va a guardar
			savenodes("") saveasversion: 2014
			-- obtenemos la direccion de la scena
			getdir #scene;
			--
			maxfilename 
			--
			maxfilepath
			-- cargamos el  archivo 
			loadmaxfile("");
			-- abrir aplicaciones extras
			shellLaunch "";
			-- para exportar  : # noprompt slectedOnly:true
			exportfile ("");
			--todos los plugins a exportar
			exporterPlugin.classes
			a=getFiles;
			
			
			