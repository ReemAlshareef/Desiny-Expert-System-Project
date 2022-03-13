/* Disney Character.pro
  Disney Character identification game.

    start with ?- go.     */



go() :- write('|-------------------------------------|'),nl,
        write('|                                     |'),nl,
        write('|*************************************|'),nl,
        write('| Welcome To Our Disney Expert System |'),nl,
        write('|*************************************|'),nl,
        write('|                                     |'),nl,
        write('|-------------------------------------|'),nl,
        write('|                                     |'),nl,
        write('|  *please put "." after each query*  |'),nl,
        write('|                                     |'),nl,
        write('|-------------------------------------|'),nl,
        write('|         Lets Get Started!!          |'),nl,
        write('| Answer The Questions with yes Or no |'),nl,
        write('|                                     |'),nl,
        write('|-------------------------------------|'),nl,


        hypothesize(Character),
        write('                                      '),nl,
        write('I guess that the disney character is: '),
        write('                                      '),nl,
        write(Character),nl,
        write('|                                     |'),nl,
        write('***************************************'),nl,
        write('********||| I hope You Enjoed|||*******'),nl,
        write('**************************************'),nl,
        write('|                                     |'),nl,
        undo.

/* hypotheses to be tested */
hypothesize(peterPan)   :- peterPan, !.
hypothesize(alice)     :- alice, !.
hypothesize(tata)   :- tata, !.
hypothesize(pumbaa)   :- pumbaa, !.
hypothesize(belle)   :-belle, !.
hypothesize(jean )   :-jean , !.
hypothesize(unknown).             /* no diagnosis */


/* disney character identification rules */
peterPan :- child, verify(has_no_parents),
           verify(wears_a_hat),
           verify(the_hat_is_green),
           verify(dont_grow_up),
           verify(short),
           verify(can_fly),
           verify(wears_green_clothes),
           verify(dealing_with_pirates),
           verify(live_with_kids),
           verify(live_in_Neverland).
alice :- child,
             verify(wears_a_dress),
             verify(the_dress_is_blue),
             verify(wears_black_ribbon),
             verify(curious),
             verify(has_blue_eyes),
             verify(uses_her_imagination),
             verify(skinny),
             verify(wears_a_white_apron),
             verify(followed_a_rabbit),
             verify(goes_to_Wonderland).
tata :- animal, verify(is_an_elephant),
			verify(coward),
			verify(walks_on_four),
			verify(friends_with_tarazan),
			verify(have_big_ears),
			verify(have_horns),
			verify(was_in_tarazan_movie),
			verify(friendly_with_human),
			verify(gaint),
			verify(big_snout).
pumbaa :- animal, verify(is_a_pig),
			  verify(walks_on_four),
			  verify(friends_with_timon),
			  verify(is_wild),
			  verify(kind),
			  verify(lives_in_africa),
			  verify(friends_with_simba),
			  verify(was_in_lion_king_movie),
			  verify(has_a_tail),
			  verify(says_hakuna_matata).

belle :-  woman, verify(has_brown_hair),
                 verify(is_princess),
			     verify(talks_to_things),
				 verify(sings),
			 verify(has_father),
			 verify(wears_yellow_dress),
			 verify(got_married),
			 verify(is_white),
			 verify(reads),
			 verify(lived_with_beast).

jean  :-  woman, verify(has_brown_hair),
			 verify(has_father),
				 verify(wears_yellow_dress),
			 verify(got_married),
			 verify(is_strong_and_brave),
			 verify(is_English),
				 verify(lives_in_jungle),
			     verify(loves_animal),
			 verify(is_animal_researcher ),
				 verify(is_wife_of_Tarzan).

/* classification rules */
child    :- verify(has_brown_hair), !.
child    :- verify(has_blond_hair), !.
animal   :- verify(is_an_elephant), !.
animal   :- verify(is_a_pig), !.
woman    :- verify(is_woman), !.

/* how to ask questions */
ask(Question) :-
    write('Does the disney character have the following attribute: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes()),fail.
undo :- retract(no()),fail.
undo.
