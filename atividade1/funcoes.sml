val d1 = 10
val m1 = 01
val a1 = 2001

val d2 = 20
val m2 = 04
val a2 = 2010 

fun positivo(num:int)=
	if num > 0 
	then true
	else false;


fun positivo1(data1: (int * int * int), data2: (int * int * int ))=
	if(( positivo(#1 data1) )
		andalso(positivo(#2 data1))
		andalso(positivo(#3 data1))
		andalso(positivo(#1 data2))
		andalso(positivo(#2 data2))
		andalso(positivo(#3 data2)))
	then true
	else false;


fun verifica_data(data1: (int * int * int), data2: (int * int * int) )=
	if(positivo1((#1 data1,#2 data1,#3 data1),(#1 data2,#2 data2,#3 data2)) = false)
	then false 
	else ( if(((#1 data1)<30)
	  andalso((#1 data2)<30) 
	  andalso((#2 data1)<12)
	  andalso((#2 data2)<12)
	  andalso((#3 data1)<2021)
	  andalso((#3 data2)<2021) )  
	  then true 
	  else false);

fun igual(data1: (int * int * int), data2: (int * int * int) )=
	if( (#1 data1)=(#1 data2)
		andalso((#2 data1)=(#2 data2))
		andalso((#3 data1)=(#3 data2))) 
	then false
	else true;

(*exercicio 1 : não faz verificação de dados *)
fun mais_velho(data1: (int * int * int),data2: (int * int * int) )=
	if((#1 data1)>(#1 data2))
	then false
	else if((#2 data1)>(#2 data2))
	then false
	else if((#3 data1)>(#3 data2)) 
	then false
	else true; 

(*exercicio 1 : faz verificação de dados *)
fun mais_velho2(data1: (int * int * int),data2: (int * int * int) )=
	if( verifica_data((#1 data1,#2 data1,#3 data1),(#1 data2,#2 data2,#3 data2)) = true)
	then ( if(igual((#1 data1,#2 data1,#3 data1),(#1 data2,#2 data2,#3 data2)) = false)
				then false
				else mais_velho((#1 data1,#2 data1,#3 data1),(#1 data2,#2 data2,#3 data2)))
	else false;


mais_velho((d1,m1,a1),(d2,m2,a2));
mais_velho2((d1,m1,a1),(d2,m2,a2));