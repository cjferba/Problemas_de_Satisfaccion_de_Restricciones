:- lib(ic).
:- lib(ic_edge_finder3).
:- lib(branch_and_bound).

%Carlos Jesus Fernandez Basso

solve4(Vars):-
	A=[AFT,AWSJ,AE,ACD], % lestura alejandro
		%AMD,ADA,AMB,AGN
	B=[BWSJ,BE,BFT,BCD], % lectura de bruno
	C=[CE,CWSJ,CFT,CCD], % lectura carlos
	D=[DCD,DFT,DWSJ,DE], % lectura daniel
	End=[A_end,B_end,C_end,D_end],
	
	A :: 30..360,
	B :: 45..360,
	C :: 45..360,
	D :: 90..360,
	End :: 90..360,
	End_of_Ends :: 90..360,
	
	AFT#>=30,
	AWSJ#>=AFT+60, %  Alex
	AE#>=AWSJ+30,
	ACD#>=AE+2,
	A_end#>=ACD+5,
	
	BWSJ#>=45,
	BE#>=BWSJ+75, %  Bruno
	BFT#>=BE+3,
	BCD#>=BFT+25,
	B_end#>=BCD+10,
	
	CE#>=45,
	CWSJ#>=CE+5, % Carlos
	CFT#>=CWSJ+15,
	CCD#>=CFT+10,
	C_end#>=CCD+30,
	
	DCD#>=90,
	DFT#>=DCD+90, %  Daniel
	DWSJ#>=DFT+1,
	DE#>=DWSJ+1,
	D_end#>=DE+1,
		% Leer "Financial Times":
	disjunctive([AFT,BFT,CFT,DFT],[60,25,10,5]),
		% leer "Wall Street Journal":
	disjunctive([AWSJ,BWSJ,CWSJ,DWSJ],[30,75,15,5]),
		% leer "Expansion":
	disjunctive([AE,BE,CE,DE],[2,3,5,9]),
		% leer "Cinco Dias":
	disjunctive([ACD,BCD,CCD,DCD],[5,10,30,90]),
		% restriccion de que cada lector lea solo un periodico.
		% lee Alex:
	cumulative([AFT,AWSJ,AE,ACD],[60,30,2,5],[1,1,1,1],1),
		% lee Bruno:
	cumulative([BWSJ,BE,BFT,BCD],[75,3,25,10],[1,1,1,1],1),
		% lee Carlos:
	cumulative([CE,CWSJ,CFT,CCD],[5,15,10,30],[1,1,1,1],1),
		% lee Daniel:
	cumulative([DCD,DFT,DWSJ,DE],[90,1,1,1],[1,1,1,1],1),
	maxlist(End,End_of_Ends),
	minimize(labeling([AFT,AWSJ,AE,ACD,BWSJ,BE,BFT,BCD,CE,CWSJ,CFT,CCD,DCD,DFT,DWSJ,DE,A_end,B_end,C_end,D_end]), End_of_Ends),nl,
	write("A = "),write(A),nl,
	write("B = "),write(B),nl,
	write("C = "),write(C),nl,
	write("D = "),write(D),nl,
	V=["Alex","Financial Times",60,"Alex","Wall Street Journal",30,"Alex","Expansion",2,"Alex","Cinco Dias",5,"Bruno","Wall Street Journal",75,
	"Bruno","Expansion",3,"Bruno","Financial Times",25,"Bruno","Cinco Dias",10,"Carlos","Expansion",5,"Carlos","Wall Street Journal",15,
	"Carlos","Financial Times",10,"Carlos","Cinco Dias",10,"Daniel","Cinco Dias",90,"Daniel","Financial Times",1,"Daniel","Wall Street Journal",1,
	"Daniel","Expansion",1],
	present_schedule([AFT,AWSJ,AE,ACD,BWSJ,BE,BFT,BCD,CE,CWSJ,CFT,CCD,DCD,DFT,DWSJ,DE],V,Vars).
	
	
	present_schedule([],[],[]).
	
	present_schedule([H1|T1],[H21,H22,H23|T2],X) :-
	convert_time(H1, FG, FM),
	HH is H1+H23,
	convert_time(HH, TG, TM),nl,
	write(H21),write(" lee "),write(H22),write(" de "),
	write(FG),write(":"),write(FM),
	write(" a "),write(TG),write(":"),write(TM),
	X=[[H21,lee,H22,de,[FG,:,FM],a,[TG,:,TM]]|Cola],
	present_schedule(T1,T2,Cola).
	
	
	convert_time(Time,Hours,Minutes) :-
	div(Time, 60, G),
	Hours is G + 7,
	mod(Time,60,Minutes).
                
 
                
 
