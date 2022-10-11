% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Camillia Amin 
%%%%% NAME: Rudaba Syed
%%%%% NAME: Mayra Mussarrat
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% RULE: listMap
% Add the rule(s) for part a below

listMap([KLHead | KLTail], [VMHead | VMTail], Key, Value) :- Key = KLHead, Value = VMHead. 
listMap([KLHead | KLTail], [VMHead | VMTail], Key, Value) :- listMap(KLTail, VMTail, Key, Value).

%%%%% RULE: encodeList
% Add the rule(s) for part b below
encodeList([HList | TList], MapKeysList, MapValuesList, EncodedList) :- TList = [], listMap(MapKeysList,MapValuesList,HList,Value), EncodedList = [Value].

encodeList([HList | TList], MapKeysList, MapValuesList, EncodedList) :- 
listMap(MapKeysList,MapValuesList,HList,Value), 
append([Value], EncodedValue, EncodedList), 
encodeList(TList, MapKeysList, MapValuesList, EncodedValue).

%%%%% RULE: consecutiveCount 
%  Add the rule(s) for part c below 
% base case: where there is only one element in the list the %program will terminate counting
consecutiveCount([H],0).

% recursive case: increment counter when consecutive elements %are equal
consecutiveCount([H,W|T],Count) :- H=W, consecutiveCount([W|T],N1), Count is N1+1.

% recursive case: the counter does not increment when %consecutive elements are not equal
consecutiveCount([H,W|T],Count) :- not(H=W), consecutiveCount([W|T],Count).

%%%%% RULE: splitOnInt
%  Add the rule(s) for part d below 

% anything anonymous/arbitrary will split an empty list into two empty lists
splitOnInt([], _, [], []).

% returns a list of integers less or equal than the given value in no larger list
splitOnInt([H | T], V,[H | LT], NoSmallerList) :- H =< V, splitOnInt(T, V, LT, NoSmallerList).

% returns a list of integers greater than the given value in no larger list
splitOnInt([H | T], V, NoLargerList, [H | ST]) :- not(H = V), H > V, splitOnInt(T, V, NoLargerList, ST).




%%%%% RULE: incAverage
% Add the rule(s) for part e below

%% incAverage uses predefined predicates sum to calculate the sumation and length  to find the number of element of the given list to calculate the average

incAverage([H|T], Average, NumElements) :- length([H|T], L), NumElements is L, sum([H|T], S), Average is (S//L).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
