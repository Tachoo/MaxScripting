--Falta la funcion;

--Materiales

MatEditor.mode=#advanced;
MatEditor.mode =#basic;

MatEditor.Open() --Abrir el editor de materiales
SME.Open(); --Abre el slare material

A=Medit.GetCurMtl();-- te da el valor slot selecionado en la ventana de materiales del compact editor
A.name ="1_Mat";-- para combiar el nombre del material seleccionado
medit.setactivemtlslot 4 false;
b=Medit.GetCurMtl();
a.name="B_Mat";

-- otra forma de acceder al material
medit.putmtlToMtlEditor a 2; -- Selecciona en la interface 
meditMaterials[1].diffuse = red; -- Hacemos cosas directamente en el material
a.difuse=yellow; -- cambiamos el color despues.

select for o in objects where (o.material ==Medit.GetCurMtl() collect o)
--Objeto u objetos que tenga asigandos el material selecionado en el slot de materiales
selec (for o in objects where try(o.material.name == "1_mat") catch (false ) collect o

cian = color 0 255 255 
magenta = color 255 0 255 
colores=#()
Ncolores=#("rojo","Verde","Magenta","Azul","cian","magenta","Amarillo")
-- Crear en los slots de materiales con los colores base 

form m=1 to colores.count do 
(
	meditmaterials[m] = standard difduse : (colores[m]) name :("M_"+Ncolores[m])
	
)
for o in geometry do o.material = meditmaterials[random 1 6]
	

for i = 1 to 6 do
(
box pos: []
)
/*
fuera de la duncion crear 6 objetos primitivos diferentes  separados cada uno con los ejex X o Y 
Y que no se encimen cada objeto tendra el nombre base original mas G_
*/

/*
Funcion:
asegurarse si hay objetos en la scena

La funcion hara el arreglo de colores cmy y rgb con sus respectibos nombres en espa;ol 

estos colores se le asigaran al canal diffuse de cada material que debera ser creado para cada objeto en la scena 
, cada uno sele debe asignar el nombre de "Mat_"Nombre del objeto y nombre del color del material que se le asigno

-- en caso de exixtir mas de 6 objetos en la scena deben de crear la cantidad de colores random entre blanco y negro necesarios asi como nombres unicos 
para los materiales nuevos con la froma "Mat_Nombredelobjeto_nombre del color"


*/
fn ArrayColorsCMYRGB=
	(
	MyArrrayColors=#("Rojo","Verde","Azul","Amarillo");
    MyArrayRGB	
	)

	
	/* Modificadores*/
	/*
	
	*/
	addmodifier $p1(Turbosmooth()) -- Agregar el modificador de TurboMooth
		$p1.modifiers -- lista de modificadores;
		class of $p1.modifiers[1]-- para saber  la classe del primer modificador agregado al stack
		class of (Turbosmooth())-- para saber la classe del modificador
			
			deletemodifier $p1.modifiers 1 -- borra el primer modificador en el stack del objetos.
			
			for o in objects do for m in o.modifiers where classof m == Turbosmooth do
				deletemodifier o m;
			
			for i=10 to 1 by -1 do 	for o in objects do for n=o.modifiers.count to by -1 where(classof o.modifiers[n]==Turbosmooth)do deletemodifier o n --
			
			--
			ts= turbosmooth iterations: 2 ;
			--
			for o in geometry do addmodifier  o ts
			--
			for o in geometry where (for m in o.modifiers where classof m==Turbosmooth collect m).count == 0 do addmodifier o ts;
			
			-- corre mas rapido
			max create mode -- si esta en modo de script corren mucho mas rapido;
			deselect $*
			for o in geometry  do  for m in o.modifiers do m.modifiers.enabled;