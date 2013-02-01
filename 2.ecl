:-lib(suspend).
%Carlos Jesus Fernandez Basso

solve2(Vars):-
  Matriz=[[_,morado,_,_],[_,_,_,0],[ana,_,_,_],[_,_,mejillones,_],[_,negro,_,_]],  
  %posibles fechas de los cumpleanios
  C=[marzo_22,abril_10,mayo_22,junio_22,agosto_1],
  
  %gustavo no vive en la casa rojo
  (member([gustavo,verde,_,_],Matriz);member([gustavo,amarillo,_,_],Matriz);member([gustavo,negro,_,_],Matriz);member([gustavo,morado,_,_],Matriz)),
  %(member([enrique,verde,_,_],Matriz);member([enrique,amarillo,_,_],Matriz);member([gustavo,negro,_,_],Matriz);member([gustavo,morado,_,_],Matriz)),
  
  %gustavo comple anios despues que el duenio de la casa rojo
  member([gustavo,_,_,X],Matriz),
  member([_,rojo,_,Y],Matriz),
  X#>Y,
  
  %lasania le gusta al clumple agosto
  member([_,_,lasania,4],Matriz),
  
  %a gustavo no le gusta el pez espada
  (member([gustavo,_,lasania,_],Matriz);member([gustavo,_,ostras,_],Matriz);member([gustavo,_,majillones,_],Matriz);member([gustavo,_,calamares,_],Matriz)),
  
  %Entre Juan y Gustavo, uno cumple anios el 1 de Agosto y el otro vive en la casa negro.
  (((member([gustavo,_,_,4],Matriz)) , (member([juan,negro,_,_],Matriz))) ; ((member([gustavo,negro,_,_],Matriz)) , (member([juan,_,_,4],Matriz)))),
  
  %el duenio de la casa amarillo no cumple anios el 22 de mayo
  (member([_,rojo,_,2],Matriz);member([_,verde,_,2],Matriz);member([_,negro,_,2],Matriz);member([_,morado,_,2],Matriz)),
  
  %enrique no vive en la casa verde
  (member([enrique,morado,_,_],Matriz);member([enrique,amarillo,_,_],Matriz); member([enrique,rojo,_,_],Matriz);member([enrique,negro,_,_],Matriz)),
  
  %la persona que cumple anios el 10 de abril vive en la casa negro
  member([_,negro,_,1],Matriz),
  
  %El duenio de la casa amarillo es o bien el que come ostras o bien el que come
  %lasania.
  (member([_,amarillo,ostras,_],Matriz) ; member([_,amarillo,lasania,_],Matriz)),
  
  %El duenio de la casa negro cumple anios antes que Juan.
  member([_,negro,_,X1],Matriz),
  member([juan,_,_,Y1],Matriz),
  X1#<Y1,
  
  %el dueño de la casa negro cumple anios despues que el de la roja
  member([_,negro,_,X2],Matriz),
  member([_,rojo,_,Y2],Matriz),
  X2#>Y2,
  
  member([enrique,_,_,_],Matriz),
  member([agustin,_,_,_],Matriz),
  member([_,_,_,3],Matriz),
  member([_,_,_,2],Matriz),
  member([_,verde,_,_],Matriz),
  member([_,_,calamares,_],Matriz),
  member([_,_,ostras,_],Matriz),
  member([_,_,lasania,_],Matriz),
  member([_,_,pez_espada,_],Matriz),
  A=[Duenio,verde,Comida,Fec],
  member(A,Matriz),
  buscar(C,0,Fec,Mes),
  Vars=[Duenio,verde,Comida,Mes].

  

   
buscar([Valor|_],Cont,Indice,Valor):-Cont=Indice.
buscar([_|Cola],Cont,Indice,Valor):-Cont2 is Cont+1,buscar(Cola,Cont2,Indice,Valor).                
 
                
 
