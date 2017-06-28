--ANGULOSERGIO_P3D_E3_A
--19/06/2017
--20/06/2017  Objetivo de hoy  ter minar  a y b  aun que  no duerma;
--Laptop 
--openlog "C:/Users/Tachoo/Documents/ProgramacionMaxScript/ANGULOSERGIO_P3D_E3_A.txt" mode:"a"

--Desktop 
openlog "E:/ICloud_Dropbox/Dropbox/UNIAT Univercidad/MaxScripting/MaxScripting/ANGULOSERGIO_P3D_E3_A.txt" mode:"a"
/*
FUNCION A (valor 10 puntos)
La función debe
Comprobar si hay objetos en la escena, si no los hay debe mostrar en un messagebox “NO HAY OBJETOS EN ESCENA”. --OK!

En caso de que si haya objetos en la escena debe :

Configurar la escena cambiando el color del background a 9,9,9, y las unidades a metros en base a centímetros.
Todas las geometrías deben tener activado la propiedad de BackfaceCull y desactivada la de Show frozen in gray.
Re nombrar todas las geometrías con G_ + el nombre original del objeto, todas las luces con L_+ el nombre original del emisor, y para todos los Hellers con H_+ el nombre original del Helper.
Revisar si alguna objeto de tipo geometría en escena tiene la escala y/o el pivote incorrecto, en tal caso debe cambiarle el color de wirecolor a rojo y guardar los nombres de los objetos para cada caso.
Después de clasificarlos, debe resetear su pivote a la orientación correcta y corregir la escala de los objetos que están mal y 

mostrar en un messagebox la cantidad total de objetos corregidos.

En otro MessageBox debe desplegar  con el letrero de “HAY <CANTIDAD> OBJETOS DE TIPO GEOMETRIA, <CANTIDAD> LUCES Y <CANTIDAD> HELPERS EN ESCENA.”
En caso de que haya encontrado objetos de tipo geometría que tenian la escala o el pivote incorrecto, debe mostrar en un 

MessageBox “HABIA <CANTIDAD> OBJETOS CON LA ESCALA INCORRECTA Y SUS NOMBRES SON <NOMBRES> 
HABIA <CANTIDAD> QUE TENIAN LA ORIENTACION DEL PIVOTE MAL Y SUS NOMBRES SON <NOMBRES>”
*/
--Funcion sin obtener valores***
--Terminamos la funcion A
fn A=
	(
		--Comprobar si  existen objetos en la scena
		if (geometry.count!=0 or cameras.count!=0 or helpers.count!=0 or lights.count!=0 or shapes.count!=0 or spacewarps.count!=0)then
		(
			--Variable para hacer el display
		
			--Arreglos para los nombres
			NameGeoScale=#();
			NameGeoPivot=#();
			--Arreglos de nombres
			--Existen
			messagebox "HAY OBJETOS EN ESCENA";
			--Debemos de cambiar el color del background 
            setBckgroundColor=(color 9 9 9);
			--Debemos de cambiar el sistema de unidades
			units.displaytype =#Metric;
			units.SystemType =#Centimeters;
			units.MetricType=#Centimeters;			
			--Debemos de activar la opcion a cada objeto de su backfacecull y el frozen in gray
			--Debemos de ReNombrar las geometrias ... creo que lo podria hacer  con las variables mapeadas.
			--Debemos de  ver si tienen la scala mal y/o el pivote mal y cambiarle el wirecolor a Rojo
			/*Puedo hacerlo en este for todo lo demas*/
			for i=1 to geometry.count do
				(
					--Nombre
					
					geometry[i].name="G_"+geometry[i].name;
					--SetOP
					if(geometry[i].backfacecull!=true)do(geometry[i].backfacecull=true;)
					if(geometry[i].showfrozeningray!=true)do(geometry[i].showfrozeningray=true;)
					--SetOP
					--Creo que el maestro quiere un switch  pero no quiero hacerlo.
					if(geometry[i].scale!=[1,1,1])then 
					(
						--Guardamos los nombres en el arreglo correspondiente
						append NameGeoScale geometry[i].name;
						--Cambiar el color
						geometry[i].wirecolor = red;
						--Reset la scala
						geometry[i].scale=[1,1,1];
						--Reset pivot
					)else
					(
						--solo para saber que estan bien
						geometry[i].wirecolor = green;
					)
						--Sabemos que no es por scala 
						--debemos preguntar si es por rotacion
						if(geometry[i].rotation!=(quat 0 0 0 1) ) then
						(
							--Guardamos los nombres en el arreglo correspondiente
							append NameGeoPivot geometry[i].name;
							--Cambiamos el color
							geometry[i].wirecolor = red;
							--Si es por rotacion debemos de resetear el pivote y todos sus componentes
							ResetScale geometry[i];
							ResetPivot geometry[i];
							
						)
						else
						(
							--solo para saber que estan bien
							geometry[i].wirecolor = green;
						)
					

				)--OK
				/*Solo si encontramos algo en los arreglos  es sintoma que realmente hay algo mal*/
				if(NameGeoScale.count >0 or NameGeoPivot.count>0)do
				(
					temp= ((NameGeoScale.count+NameGeoPivot.count)as string)+"objetos correjidos";
				 messagebox temp;
				)
				/**/
			--Debemos hacer el cambio de nombre con el prefijo  para los demas
			--Luces
			for i=1 to lights.count do(lights[i].name="L_"+lights[i].name;)--OK
			--Helpers
			for i=1 to helpers.count do(helpers[i].name="H_"+helpers[i].name;)--OK
			/*Display Section */
				if(NameGeoScale.count >0 or NameGeoPivot.count >0)then
				(
					--Comienzo a odiar los Messagebox.  Realmente debo preguntar como demonios haces esta cosa.  o minimo decirle al maestro que ya no ponga ningun mensaje... en el resto de los ejercicios.
					
					--
				geosc=	"HABIA\t"+(NameGeoScale.count as string)+"\tOBJETOS CON LA ESCALA INCORRECTA"
				geocountsc=	"Y SUS NOMBRES SON\t"+(NameGeoScale as string)--No creei que solo debia de poner el arreglo ... no sirvo como programador de max script  me retirare de la carrera no puedo mas con mi estupidez.
				geopv="HABIA\t"+(NameGeoPivot.count as string)+"\t QUE TENIAN LA ORIENTACION DEL PIVOTE MAL"
				geocountpv=" Y SUS NOMBRES SON\t"+(NameGeoPivot as string);--No creei que fuera tan facil hacerlo string
					
				--Ya se que funciona  ... pero por que jodidasmadres no puedo poner el nombre de todos los pendejos objetos aqui  si solo es un inutil for  para hacer un mega string  pero no funciona la putada esta.	
					DisplayMessagebox=geosc+geocountsc+geopv+geocountpv;
					MessageBox DisplayMessagebox;
				)
				else
				(
				--Caso en el que no exista un problema
					Geo="HAY \t"+(geometry.count as string)+"\t OBJETOS DE TIPO GEOMETRIA,\t";
					Lig=(lights.count as string)+"\t LUCES Y \t";
					Hel=(helpers.count as string)+"\tHELPERS EN ESCENA.";
					displaymensaje=GEO+Lig+hel;
			      messagebox displaymensaje;
				)
			/*Display Section */
			
			
		)else
		(
			--No Existen
			messagebox "NO HAY OBJETOS EN ESCENA";
		)
	
	)
--Terminamos la funcion a 	

	/*
	FUNCIÓN B (valor 8 puntos)
La función debe 
Crear un rig de iluminación con Omni lights que recibe el parámetro de cuantas luces se quieren crear.
	
Debe revisar si hay objetos en escena, si los hay y el parámetro de cuantas luces  a crear es entero y mayor o igual a 3 creara la luces.
Si se le pasa un valor indefinido, 
	no entero o menor a 3 debe desplegar un messagebox con la leyenda 
	
	de que el valor del parámetro es incorrecto, que debe ser mayor o igual a 3 y entero.
Se debe de pre establecer los colores y nombre de luces iniciales, 
	
	si estas son 3, seria rojo, verde, azul y
	los nombres de rim, fill, key (en este orden), en caso de que el numero sea mayor a tres se agregaran colores random de blanco a negro a los colores base,

	y para los nombres serán nombres únicos basándose en los nombres preestablecidos para generar los nombres extras.
Para determinar la posición de cada una de las luces a crear estará basado en la creación de un Ngon la cantidad de luces a crear será igual a la cantidad de lados del Ngon, el radio lo determinara por el doble de la distancia entre la primera geometría de la escena en su coordenada mínima y la ultima geometría en la escena en su coordenada máxima, tendrá el nombre de RL, la posición inicial será de (0,0 y en el eje z será la altura del primer objeto en la escena), la propiedad de Display as Box debe estar activa, y debe estar emparentado a un point helper que este en el centro de la escena.
Para determinar la posición de las luces estas serán generadas exactamente en las coordenadas de cada una de las aristas del NGon que se cree en escena, estas serán omni lights con una intensidad que será determinada por el contador  que recorrerá entre el numero de aristas del Ngon y esto se dividirá entre la cantidad de aristas del Ngon, su propiedad de rgb con los colores se asignaran de los colores establecidos, el nombre se asignara desde los nombres establecidos, se emparentara con el point Helper, su posición será determinada con las coordenadas de las aristas del Ngon, al Ngon se le debe desactivar la propiedad de Renderable.
Finalmente se le asignara una animación constante al point Helper central para que gire sobre su propio eje z.

	*/
	--funcion b mas dolor de cabeza
	--Que demonios es un rig de iluminacion ??? ... google solo me muestra cosas extra;as
	
fn b cantidad=
	(
		if(cantidad !=0.0 and cantidad >3.0 or cantidad==3)then
		(
			
		)
		else
		(
			messagebox "valor del parámetro es incorrecto, que debe ser mayor o igual a 3 y entero";
		) 
	)	
/*FUNCIÓN C (valor 10 puntos)
Hacer una función que 
Revise si hay objetos en escena, si no los hay debe mostrar en un messagebox el letrero “NO HAY OBJETOS EN LA ESCENA”
En caso contrario
debe clasificar los objetos en escena como el de mayor y el menor conteo de polígonos, 
Creara para cada uno un point helper con el nombre “H_NombreObjeto_HP” y lo emparentara con la geometría con mayor conteo de polígonos, 
Hará otro point helper con el nombre “H_NombreObjeto_LP” y lo emparentara con la geometría con menor conteo de polígonos.
Después moverá los dos point helpers al centro de la escena.
Debe mostrar un messagebox con la cantidad de polígonos que tiene el objeto que fue clasificado como HP y el nombre de la geometría, así como el conteo de polígonos menor y el nombre de la geometría correspondiente, finalmente mostrar separados por comas los nombres de todas las demás geometrías que no entraron en esa clasificación sin incluir las geometrías HP y LP en la lista, todo esto en una solo ventana.
En caso de que en la escena solo haya una geometría, debe mostrarla como el objeto de HP con su conteo y su nombre.
En el caso de que en la escena hayan 2 o más que corresponden al conteo mayor, debe asignar el parent del point helper a solo uno de los mayores, e ignorar al resto tomándolos en cuenta para el despliego de nombres de objetos no clasificados.*/
	
	
	--Dolor De cabeza Ya no quiero saber nada de MaxScript en los siguientes a;os.
	  -- Funciona pero no como deberia ...  
fn C=
	(
		
		if (geometry.count!=0 or cameras.count!=0 or helpers.count!=0 or lights.count!=0 or shapes.count!=0 or spacewarps.count!=0)then
	     	(
				
				     all=#();
				    GP=#();
					NP=#();
				lpindex=0;
				index=0;
				for i=1 to geometry.count do
					(
						--PL= ((getPolygonCount geometry[i]));
						 GP[i]=((getPolygonCount geometry[i]));
						 append np (amax GP[i]);
						-- Este es para los vertices creo append np (amin GP[i]);
					)
				-- tenemos el maximo y el minimo  eureca ! :v 
						HP=amax NP;
					    LP=amin NP;
					
					for i=1 to NP.count do
						( 
							if(hp==np[i] and lp==np[i])do
							(
								lowpolyindex=0;
								point name:"hp";
								$hp.pos=geometry[i].pos
								geometry[i].parent=$hp;
								$hp.pos=[0,0,0]
								$hp.name="H_"+geometry[i].name+"_HP"
								temp= classof geometry[i] as string;
								displaylp="HP"+"Num of polys:\t"+((hp)as string)+"\t type:\t"+temp;
								messagebox displaylp;
							)
							
							if(hp==np[i])do
							(
								Hpyindex=i;
								point name:"hp";
								$hp.pos=geometry[i].pos
								geometry[i].parent=$hp;
								$hp.pos=[0,0,0]
								$hp.name="H_"+geometry[i].name+"_HP"
								temp= classof geometry[i] as string;
								displaylp="HP"+"Num of polys:\t"+((hp)as string)+"\t type:\t"+temp;
								messagebox displaylp;
							)
							
						)
						--
						for i=1 to NP.count do
						(
						if(lp==np[i])do
							(
								lowpolyindex=i;
								point name:"lp";
								$lp.pos=geometry[i].pos
								geometry[i].parent=$lp;
								$lp.pos=[0,0,0]
								$lp.name="H_"+geometry[i].name+"_LP"
								temp= classof geometry[i] as string;
								displaylp="LP"+"Num of polys:\t"+((lp)as string)+"\t type:\t"+temp;
								messagebox displaylp;
							)
						)
					
					for i=1 to NP.count do
						(
							if( i !=0 and i !=lowpolyindex and  i !=Hpyindex)do
							(
							  	append All (geometry[i].name+",\t");
							)
						)
						
						messagebox (all as string);
          --messagebox NC;
		
	)
		else
		(
			--No Existen
			messagebox "NO HAY OBJETOS EN ESCENA";
		)
	)
	
	
	
	