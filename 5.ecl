%Carlos Jesus Fernandez Basso

solve5(Vars):-
A1=[[e1,e2,e3,e4],1],  
A2=[[e1,e2,e3,e4],2],  
A3=[[e9,e10],3],  
A4=[[e1,e2,e3,e5,e6,e7,e8,e9,e10],4],  
A5=[[e2,e3,e4,e6],5],  
A6=[[e1,e8,e9,e10],6], 
Dias=[[[_,_],[_,_]],[[_,_],[_,_]],[[_,_],[_,_]],[[_,_],[_,_]]], 

pre(A1,Dias),
pre(A2,Dias),
pre(A3,Dias),
pre(A4,Dias),
pre(A5,Dias),
pre(A6,Dias),
pre([[libre],libre0],Dias),
pre([[libre],libre1],Dias),
bien(Dias),
Dias=[[[_,A],[_,B]],[[_,C],[_,D]],[[_,E],[_,F]],[[_,G],[_,H]]],
Vars=[[dia_1,[mañana,[A,B]],[tarde,[C,D]]],[dias_2,[mañana,[E,F]],[tarde,[G,H]]]].


%pre(Elementos en lista([[1,2,3],num]),Dias([[[_,_],[_,_]],[[_,_],[_,_]],[[_,_],[_,_]],[[_,_],[_,_]]])).
pre(X,[C|_]):- member(X,C).
pre(X,[_|Lista]):- pre(X,Lista).
pre(_,[]):-fail.

%pre(X,[A,B,C,D]):- (member(X,A),comprobar(A));(member(X,B),comprobar(B));(member(X,C),comprobar(C));(member(X,D),comprobar(D)).
%pre(X,[_|Lista]):- pre(X,Lista).

bien([A,B,C,D]):-comprobar(A),comprobar(B),comprobar(C),comprobar(D).
comprobar([[A|_],[B|_]]):-probar(A,B).
probar([X|Lista],J):-notmember(X,J),probar(Lista,J).
probar([],_).


notmember(X,L) :-
member(X,L), !, fail ; true.
                
 
                
 
