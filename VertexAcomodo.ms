--codigo para posicionar un objeto en el prmer vertice de un mesh  solo si esta en  el piso

Teapot name:"T1" radius: 3
plane name:"p1"
--converttopoly $p1;
converttomesh $p1;
posT1=getvert $p1.mesh 2;
$t1.pos =posT1;
--si esta girado
post1=post1*$p1.transform
$t1.pos =post1

-- convertir el codigo de arriba en una funcion 
-- con dos parametros que pueden ser objetos de tipo geometria , luces o helpers
--

fn Moveobj baseobj moveobj real=
	(
		real as integer
		if(real ==undefined or real == 0 )then
		(
			real=3;
		)
		--
		
		
		--
		if(superclassof baseobj==geometryclass)do
		(
			--sabemos que es un objeto de tipo geometria
			
			converttomesh baseobj;
			
		)
	--
		if(real!=0 and real>0 and real<=meshop.getnumverts baseobj)then
		(
			--sabemos que tenemos un valor real  dentro de los parametros del vertice
			posvert=getvert baseobj.mesh real;
			posvert=posvert*baseobj.transform;
		    
		)
		--
		if(superclassof moveobj==helper or superclassof moveobj==light)do
		(
			moveobj.pos=posvert;
		)
		--
	)


--material
mateditor.mode =#Advanced;
mateditor.mode=#basic;