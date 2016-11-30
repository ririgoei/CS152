victim(mr_boddy).
victim(cook).
victim(motorist).
victim(police_officer).
victim(yvette).
victim(singing_telegram).

suspect(professor_plum).
suspect(mrs_peacock).
suspect(mrs_white).
suspect(miss_scarlet).
suspect(colonel_mustard).
suspect(mr_green).
suspect(wadsworth).

weapon(wrench).
weapon(candlestick).
weapon(lead_pipe).
weapon(knife).
weapon(revolver).
weapon(rope).

room(hall).
room(kitchen).
room(lounge).
room(library).
room(billiard_room).

murder(mr_boddy,candlestick,hall).
murder(cook,knife,kitchen).
murder(motorist,wrench,lounge).
murder(police_officer,lead_pipe,library).
murder(singing_telegram,revolver,hall).
murder(yvette,rope,billiard_room).

motiveToKill(mr_boddy, S) :- suspect(S), S \= wadsworth, S \= mr_green, S \= mrs_white.
motiveToKill(cook, mrs_peacock).
motiveToKill(motorist,colonel_mustard).
motiveToKill(yvette,miss_scarlet).
motiveToKill(yvette,colonel_mustard).
motiveToKill(yvette,mrs_white).
motiveToKill(police_officer,miss_scarlet).
motiveToKill(singing_telegram,professor_plum).
motiveToKill(singing_telegram,wadsworth).

weaponUsed(colonel_mustard, W) :- weapon(W), W \= rope.
weaponUsed(professor_plum, W) :- weapon(W), W \= revolver.
weaponUsed(mrs_peacock, W) :- weapon(W), W\= candlestick.
weaponUsed(mrs_white, W) :- weapon(W).
weaponUsed(miss_scarlet, W) :- weapon(W).
weaponUsed(wadsworth, W) :- weapon(W).

roomIn(miss_scarlet, R) :- room(R), R \= billiard_room, R \= hall.
roomIn(professor_plum, R) :- room(R), R \= kitchen.
roomIn(colonel_mustard, R) :- room(R), R \= hall.
roomIn(mrs_white, R) :- room(R).
roomIn(mrs_peacock, R) :- room(R).
roomIn(wadsworth, R) :- room(R).

% Update accuse to solve the murders.
% Add more facts and rules as needed.
accuse(V,S) :- murder(V,W,R), suspect(S), motiveToKill(V,S), weaponUsed(S,W), roomIn(S,R).