%Query  afte ask the user simple question about his/her skills
% concludes the suitable volunteer opportunity
suggest:-write('Volunteer-recommendation
expert system'),nl,
                write('Please answer questions below'),nl,
               	write('It helps to find best volunteer opportunity for you'),nl,nl, 
    guessing(Type), 
    write("After taking a simple test of your skills,  
       we expect that the right volunteer for you is "),write(Type),nl. 

% fact the Field of volunteering
field(medicalField). 
field(animalCare). 
field(hajjseason). 
field(socialField). 
field(environmentalField).
% skills that are tested based on Rules
guessing(volunteering_in_hospitals):- volunteering_in_hospitals,!. 
guessing(volunteer_at_an_animal_shelter):- volunteer_at_an_animal_shelter,!. 
guessing(volunteering_during_the_Hajj_season):-volunteering_during_the_Hajj_season,!. 
guessing(volunteer_to_restore_homes):-volunteer_to_restore_homes,!. 
guessing(volunteer_to_grow_plants):-volunteer_to_grow_plants,!.
 

 % skills rule to volunteering at hospitals
volunteering_in_hospitals:- 
    skill(caring_for_people), 
    skill(ability_to_communicate), 
    skill(time_management), 
    skill(teamwork), 
    skill(observation_and_response_speed),nl. 
 % skills rule to volunteering at animal shelter
volunteer_at_an_animal_shelter:- 
    skill(caring_for_animals), 
    skill(treat_sick_animals), 
    skill(knowledge_and_training_around_proper_animal_handling),
    skill(observation_and_response_speed),nl.  
  % skills rule to volunteering at hajj season
volunteering_during_the_Hajj_season:- 
    skill(caring_for_people), 
    skill(ability_to_communicate), 
    skill(hiking), 
    skill(teamwork),
    skill(proficiency_many_languages),nl. 
 % skills rule to volunteering at restore homes
volunteer_to_restore_homes:- 
    skill(time_management), 
    skill(teamwork),nl. 
 % skills rule to volunteering at grow plants
volunteer_to_grow_plants:-
    skill(hiking), 
    skill(teamwork),
    skill(caring_for_plants),nl.

% Query  ask the uesr some questions about his/her skills,indicating the type of volunteering
%how to ask a questions during call for skills
question(Q):- 
     
    write("Dear volunteer, do you have this skill? "), 
    write(Q),read(A),nl, 
    ((A==yes)->assert(yes(Q));assert(no(Q)),fail). 
:- dynamic yes/1,no/1. 
% to check skill
skill(M):- 
  (yes(M)->true;(no(M)-> fail;question(M))).  

% fact the name of cities
city(jeddah). 
city(riyadh). 
city(khobar). 
city(makkah). 
city(abha). 

%Query  Ask the user about  his/her city and skills and print the appropriate type for his/her
suggest(V):-  
 write("What is your city?: "), read(C),
    write("What is your skill ?: "), read(S),
    (volunteering(V,_,C,S)-> write(S);write("I cant handle your skill")),nl,write("bye!"). 

%Query  the user write the of city and will show list of volunteer opportunity in the city
volunteeringList(V,C):-write("Enter city name: "),read(C),city(C),volunteering(V,_,C,_),write("City "),write(C),write(" \t  "),write(", \t has "),write(V),nl. 

    
% predicate logic Suggest suitable volunteer opportunity   
volunteering('volunteering_in_hospitals',T,C,S):- T=medicalField, C= jeddah, (S=(caring_for_people) ; S=(ability_to_communicate) ; S=(time_management) ; S=(teamwork) ; S=(observation_and_response_speed)).
volunteering('volunteering_in_hospitals',T,C,S):- T=medicalField,C= riyadh, (S=(caring_for_people) ; S=(ability_to_communicate) ; S=(time_management) ; S=(teamwork) ; S=(observation_and_response_speed)).
volunteering('volunteering_in_hospitals',T,C,S):- T=medicalField,C= khobar, (S=(caring_for_people) ; S=(ability_to_communicate) ; S=(time_management) ; S=(teamwork) ; S=(observation_and_response_speed)).
volunteering('volunteering_in_hospitals',T,C,S):- T=medicalField,C= makkah, (S=(caring_for_people) ; S=(ability_to_communicate) ; S=(time_management) ; S=(teamwork) ; S=(observation_and_response_speed)).
volunteering('volunteering_in_hospitals',T,C,S):- T=medicalField,C= abha, (S=(caring_for_people) ; S=(ability_to_communicate) ; S=(time_management) ; S=(teamwork) ; S=(observation_and_response_speed)).
volunteering('volunteering_during_the_Hajj_season',T,C,S):- T=hajjseason,C=makkah, (S=(caring_for_people) ; S=(ability_to_communicate) ; S=(hiking) ; S=(teamwork) ; S=(proficiency_many_languages)).
volunteering('volunteer_at_an_animal_shelter',T,C,S):- T=animalCare,C= riyadh, (S=(caring_for_animals) ; S=(treat_sick_animals) ; S=(knowledge_and_training_around_proper_animal_handling) ; S=(observation_and_response_speed)).
volunteering('volunteer_at_an_animal_shelter',T,C,S):- T=animalCare,C= abha, (S=(caring_for_animals) ; S=(treat_sick_animals) ; S=(knowledge_and_training_around_proper_animal_handling) ; S=(observation_and_response_speed)).
volunteering('volunteer_at_an_animal_shelter',T,C,S):- T=animalCare,C= jeddah, (S=(caring_for_animals) ; S=(treat_sick_animals) ;  S=(knowledge_and_training_around_proper_animal_handling) ; S=(observation_and_response_speed)).
volunteering('volunteer_to_grow_plants',T,C,S):- T=environmentalField,C=jeddah, (S=(hiking) ; S=(teamwork) ; S=(caring_for_plants)).
volunteering('volunteer_to_grow_plants',T,C,S):- T=environmentalField,C=riyadh, (S=(hiking) ; S=(teamwork) ; S=(caring_for_plants)).
volunteering('volunteer_to_grow_plants',T,C,S):- T=environmentalField,C=makkah, (S=(hiking) ; S=(teamwork) ; S=(caring_for_plants)).
volunteering('volunteer_to_grow_plants',T,C,S):- T=environmentalField,C=abha, (S=(hiking) ; S=(teamwork) ; S=(caring_for_plants)).
volunteering('volunteer_to_grow_plants',T,C,S):- T=environmentalField,C=khobar, (S=(hiking) ; S=(teamwork) ; S=(caring_for_plants)).
volunteering('volunteer_to_restore_homes',T,C,S):- T=socialField,C=jeddah, (S=(time_management) ; S=(teamwork)).
volunteering('volunteer_to_restore_homes',T,C,S):- T=socialField,C=riyadh, (S=(time_management) ; S=(teamwork)).
volunteering('volunteer_to_restore_homes',T,C,S):- T=socialField,C=khobar, (S=(time_management) ; S=(teamwork)).
volunteering('volunteer_to_restore_homes',T,C,S):- T=socialField,C=makkah, (S=(time_management) ; S=(teamwork)).
volunteering('volunteer_to_restore_homes',T,C,S):- T=socialField,C=abha, (S=(time_management) ; S=(teamwork)).

    