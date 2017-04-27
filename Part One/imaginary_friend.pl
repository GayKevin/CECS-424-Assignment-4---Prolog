imaginary_friend(grizzly_bear).
imaginary_friend(moose).
imaginary_friend(seal).
imaginary_friend(zebra).

relative(circus).
relative(rock_band).
relative(spaceship).
relative(train).

solve :-
    imaginary_friend(JoanneFriend), imaginary_friend(LouFriend), imaginary_friend(RalphFriend), imaginary_friend(WinnieFriend),
    all_different([JoanneFriend, LouFriend, RalphFriend, WinnieFriend]),
    
    relative(Joannerelative), relative(Lourelative), relative(Ralphrelative), relative(Winnierelative),
    all_different([Joannerelative, Lourelative, Ralphrelative, Winnierelative]),
    
    Triples=[ [joanne, JoanneFriend, Joannerelative],
              [lou, LouFriend, Lourelative],
              [ralph, RalphFriend, Ralphrelative],
              [winnie, WinnieFriend, Winnierelative] 
            ],
    member([joanne, _, circus], Triples),    
    \+ member([_, grizzly_bear, circus], Triples),
    \+ member([lou, seal, _], Triples),    
    member([winnie, zebra, _], Triples),
    \+ member([_, grizzly_bear, spaceship], Triples),
    \+ member([_, seal, train], Triples),
    \+ member([joanne, grizzly_bear, _], Triples),
    \+ member([joanne, seal, _], Triples),
    \+ member([_, seal, spaceship], Triples),    
    
    tell(joanne, JoanneFriend, Joannerelative),
    tell(lou, LouFriend, Lourelative),    
    tell(ralph, RalphFriend, Ralphrelative),    
    tell(winnie, WinnieFriend, Winnierelative).

% Succeeds if all elements of the argument list are bound and different.
% Fails if any elements are unbound or equal to some other element.
all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(X, Y, Z) :- 
    write(X), write(' has the imaginary friend of a '), write(Y), write(' and they went on relative of: '), write(Z), nl.