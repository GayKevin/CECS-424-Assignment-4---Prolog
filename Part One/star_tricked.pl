ufo(balloon).
ufo(clothesline).
ufo(frisbee).
ufo(water_tower).

mr(barrada).
mr(gort).
mr(klatu).
mr(nikto).

solve :-
    ufo(BarradaUFO), ufo(GortUFO), ufo(KlatuUFO), ufo(NiktoUFO),
    all_different([BarradaUFO, GortUFO, KlatuUFO, NiktoUFO]),

    mr(Barrada), mr(Gort), mr(Klatu), mr(Nikto),
    all_different([Barrada, Gort, Klatu, Nikto]),

    Triples = [ [Barrada, BarradaUFO, tuesday],
                [Gort, GortUFO, wednesday],
                [Klatu, KlatuUFO, thursday],
                [Nikto, NiktoUFO, friday] ],

    (member([barrada, _, friday], Triples) ; 
     member([_, clothesline, friday], Triples)),
    \+(member([nikto, _, tuesday], Triples)),
    \+(member([klatu, water_tower, _], Triples)),
    \+(member([klatu, balloon, _], Triples)),
    \+(member([klatu, frisbee, _], Triples)),
    \+(member([gort, frisbee, _], Triples)),
    earlier([klatu, _, _], [_, balloon, _], Triples),
    earlier([_, frisbee, _], [klatu, _, _], Triples),

    tell(Barrada, BarradaUFO, tuesday),
    tell(Gort, GortUFO, wednesday),
    tell(Klatu, KlatuUFO, thursday),
    tell(Nikto, NiktoUFO, friday).

% Succeeds if all elements of the argument list are bound and different.
% Fails if any elements are unbound or equal to some other element.
all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

earlier(X, _, [X | _]).
earlier(_, Y, [Y | _]) :- !, fail.
earlier(X, Y, [_ | T]) :- earlier(X, Y, T). 

tell(X, Y, Z) :-
    write(X), write(' saw the '), write(Y), write(' on '), write(Z), write('.'), nl.