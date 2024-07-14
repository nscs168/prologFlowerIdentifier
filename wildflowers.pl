% Starts the flower identification expert system
start :-
    write('Welcome to the Flower Identification Expert System!'), nl,
    write('We will ask you a series of questions to identify the flower based on its characteristics.'), nl,
    determine_flower(Flower),
    nl, write('Based on the information you have provided, the flower might be: '), write(Flower), nl,
    undo.
	
group(aquatic):- 
	check('lives in water').
group(fern):- 
	check('has a frond leaf structure').
group(clubmoss):- 
	check('has one type of spore').
group(sedge):- 
	check('has a triangular stem').

determine_flower(canadian_waterweed) :- canadian_waterweed, !.
determine_flower(water_lobelia) :- water_lobelia, !.
determine_flower(yellow_water_lily) :- yellow_water_lily, !.
determine_flower(alpine_clubmoss) :- alpine_clubmoss, !.
determine_flower(fir_clubmoss) :- fir_clubmoss, !.
determine_flower(stags_horn_clubmoss) :- stags_horn_clubmoss, !.
determine_flower(field_horsetail) :- field_horsetail, !.
determine_flower(brittle_bladderfern) :- brittle_bladderfern, !.
determine_flower(parsley_fern) :- parsley_fern, !.
determine_flower(deergrass) :- deergrass, !.
determine_flower(hares_tail_cottongrass) :- hares_tail_cottongrass, !.
determine_flower(sand_sedge) :- sand_sedge, !.
determine_flower(unknown).

canadian_waterweed :-
    group(aquatic),
    check(color: translucent_green),
    check(leaf_type: blunt_tipped),
    check('height: 20cm').
water_lobelia :-
    group(aquatic),
    check(color: lilac),
    check(leaf_type: linear),
    check('height: 100cm').
yellow_water_lily :-
    group(aquatic),
    check(color: yellow),
    check(leaf_type: heart_shaped),
    check('height: 30cm').
alpine_clubmoss :-
    group(clubmoss),
    check(color: blue_green),
    check(leaf_type: needlelike),
    check('height: 50cm').
fir_clubmoss :-
    group(clubmoss),
    check(color: yellowish_green),
    check(leaf_type: narrow),
    check('height: 30cm').
stags_horn_clubmoss :-
    group(clubmoss),
    check(color: pale_green),
    check(leaf_type: minutely_toothed),
    check('height: 100cm').
field_horsetail :-
    group(fern),
    check(color: tan),
    check(leaf_type: leafless),
    check('height: 80cm').
brittle_bladderfern :-
    group(fern),
    check(color: green),
    check(leaf_type: lanceolate),
    check('height: 40cm').
parsley_fern :-
    group(fern),
    check(color: yellow),
    check(leaf_type: oval),
    check('height: 15cm').
deergrass :-
    group(sedge),
    check(color: brown),
    check(leaf_type: slender),
    check('height: 90cm').
hares_tail_cottongrass :-
    group(sedge),
    check(color: white),
    check(leaf_type: wiry),
    check('height: 50cm').
sand_sedge :-
    group(sedge),
    check(color: golden_brown),
    check(leaf_type: pointed),
    check('height: 100cm').
	

ask(Question) :-
( write('Is this one of the characteristics of the flower? '),
(yes(Question); no(Question))
->  true
;   write(Question), write('? '),
    read(N), nl,
    (   N == yes 
    ->  assertz(yes(Question))
    ;   assertz(no(Question)), fail
    )
).
	
:- dynamic([yes/1,no/1]).

check(S) :- (yes(S) -> true ; (no(S) -> fail ; ask(S))).

undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail. 
undo.
