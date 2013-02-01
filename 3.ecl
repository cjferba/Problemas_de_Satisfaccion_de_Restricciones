:-lib(ic).
:-lib(branch_and_bound). % para la minimizacion
%Carlos Jesus Fernandez Basso

solve3(Vars):-
	Lista = [Tin,TejesD,TejesT,Truedas1,Truedas2,Truedas3,Truedas4,Ttuercas1,Ttuercas2,Ttuercas3,Ttuercas4,Tembellece1,Tembellece2,Tembellece3,Tembellece4,Trevisa1,Trevisa2,Trevisa3,Trevisa4,TF],
	Lista :: 0..200,
	Tin #>= 0,
	
	TejesD #>= Tin+10,
	TejesT #>= TejesD+10,
	
	Truedas1 #>= TejesD+1,
	Truedas2 #>= TejesD+1,
	Truedas3 #>= TejesT+1,
	Truedas4 #>= TejesT+1,
	
	Ttuercas1 #>= Truedas1+2,
	Ttuercas2 #>= Truedas2+2,
	Ttuercas3 #>= Truedas3+2,
	Ttuercas4 #>= Truedas4+2,
	
	Tembellece1 #>= Ttuercas1+1,
	Tembellece2 #>= Ttuercas2+1,
	Tembellece3 #>= Ttuercas3+1,
	Tembellece4 #>= Ttuercas4+1,
	
	Trevisa1 #>= Tembellece1+2,
	Trevisa2 #>= Trevisa1+2,
	Trevisa3 #>= Tembellece3+2,
	Trevisa4 #>= Trevisa3+2,
	
	TF #>= Trevisa1+3,
	TF #>= Trevisa2+3,
	TF #>= Trevisa3+3,
	TF #>= Trevisa4+3,
	
	minimize(labeling(Lista),TF),
	%search(Lista, 0, first_fail, indomain, complete, []).
	%ver(Vars),
	Fin is TF-3,
	Vars=[tiemposDeInicio,[ejes_Delantero_y_Trasero,Tin,TejesD],
				[ruedas_Delan_Trase,TejesD,TejesD,TejesT,TejesT],
				[tuercas_delan_Trase,Truedas1,Truedas2,Truedas3,Truedas4],
				[embellecedores_D_T,Ttuercas1,Ttuercas2,Ttuercas3,Ttuercas4],
				[revisar_D_T,Tembellece1,Trevisa1,Tembellece3,Trevisa3],
				[inspeccion,Fin]].

				
ver([X|Cola]):-write(", "),write(X),ver(Cola).
ver([]).


                
 
                
 
