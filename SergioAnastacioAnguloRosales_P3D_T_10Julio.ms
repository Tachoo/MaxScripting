--SergioAnastacioAnguloRosales_P3D_T_10Julio
--Hacer una funcion que 
/*
Guarde  el nombre de cada uno de lo smodificadores asignadsos a cada objeto en la escena 
Debera eliminar los modificadores de cada uno de los objetos , Usando los nomnbres que guardo como base. 
(Array)
--despues eliminara los modificadores de los objetos.
--la funcion debe de tener las condiciones para asegurarse que hay objetos en la scena , si no hay debera de mostrar un mensaje 
--si existen revisar que tengan modificadores , los objetos sin modificadores quedarian descartados o no tomados en cuenta para hacer lo de la eliminacion de modificadores
-- tendran que poner algun parametroi de entrada de la funcion por ejemplo : 1  para que elimine todos los modificadores y 2 para que desactive todos lo smodificadores por objeto.
*/
--Lap
--openlog "C:/Users/Tachoo/Documents/ProgramacionMaxScript/ANGULOSERGIO_P3D_A_29_06_17.txt" mode:"a"
--Destop
openlog "E:\ICloud_Dropbox\Dropbox\UNIAT Univercidad\MaxScripting\MaxScripting\SergioAnastacioAnguloRosales_P3D_10Julio.txt" mode:"a";

/*
Debemos de tomar en cuenta que  por  cuestiones de modificadores que contienen por lo menos un espacio y algunas Mayusculas   cambian al momento de hacer el 
( (classof b)as string ) y cuando hacemos la comparacion de el arreglo  de modificadores  con el nombre del modificador aveces  son diferentes.
$.modifiers[1].name
"UVW Map" 

modscena
#("FFD_4x4x4", "Patch_Select", "Uvwmap")
*/
fn FuncionDeleteModifiers inputlayer=
	(
		if (geometry.count!=0 or cameras.count!=0 or helpers.count!=0 or lights.count!=0 or shapes.count!=0 or spacewarps.count!=0)then
		(
			--Hay algo y debemos aplicar un filtro desde un inicio para saber que tiene que y que no tiene que
			/*Debemos de  filtrar los objetos primitivos*/
			Objmod=#();--Elemnto de control Arreglo de objetos que si tienen algun modificador
			GotModifier=false;--Elemento de control
			for a in objects do
			(
				
		
				if(a.modifiers.count>=1)do
					(
						
						appendifunique Objmod (a);
					)
					
					
					--Si queda como negativo entonces no hacemos nada y sigue el flujo de datos
			)
			-- De la manera que si hay algo adentro de el arreglo  pasamos al siguiente flujo de datos .
			if(Objmod.count!=0)then
			(
				--Continue;
			)
			else
			(
				--Como no se encontro ninguno pues vamos a  informarlo
				messagebox "Los objetos no tienen algun tipo de modificador ";
			)
			--Ya tenemos el arreglo de  Objmod como nuestro arreglo unico de  objetos que si tienen modificadores 
			
			--Debemos de sacar todos los nombres de los modificadores de nuestro Arreglo para despues determinar que hacer
			modscena=#(); 
			for a in Objmod do
			(
				--todos los objetos
				for b in a.modifiers do
					(
						--Guarde  el nombre de cada uno de lo smodificadores asignadsos a cada objeto en la escena 
						appendifunique modscena ( (classof b)as string )
					)
			)
			--Ahora nuestro arreglo de  modscena tiene todos los modificadores de la scena
			
			--Eliminar los modificadores
			if(inputlayer==1)do
			(
			 
			--Ahora solo los eliminamos
			for o in Objmod do for n=o.modifiers.count to 1 by-1 where (o.modifiers[n].name==modscena[n])do deletemodifier o n;
			
			/*Final de el input 1 */
		    )
			--Desactivar  los modificadores
			if(inputlayer==2)do
			(
			-- Hacemos el enabled o disable de la vista del modificador
    		for o in Objmod do for m in o.modifiers do m.enabled=false;
            /*Final de el input 1 */				
			)			

			
				
				/*Debemos de filtrar los objetos primirtivos */
			)
			else
		    (
			messagebox "No hay Objetos primitivos en la scena";
		     )
		
		

	)
	
	