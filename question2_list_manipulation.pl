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

% base_case: first element is a match for key and value
listMap([KLHead | KLTail], [VMHead | VMTail], Key, Value) :- Key = KLHead, Value = VMHead. 

% recursive_case: elements after the first are a match for key and value
listMap([KLHead | KLTail], [VMHead | VMTail], Key, Value) :- listMap(KLTail, VMTail, Key, Value).

%%%%% RULE: encodeList
% Add the rule(s) for part b below

% encodeList(List, MapKeysList, MapValuesList, EncodedList)

% encodeList([b,b],[a,b],[1,2],X) := listMap([a,b],[1,2],b,Value), X=[2,2]
encodeList([HList | TList], MapKeysList, MapValuesList, EncodedList) :- TList = [], listMap(MapKeysList,MapValuesList,HList,Value), EncodedList = Value.

encodeList([HList | TList], MapKeysList, MapValuesList, EncodedList) :- 
write('\n'),write(HList), write(' '),write(EncodedValue),
listMap(MapKeysList,MapValuesList,HList,Value), append([Value], EncodedValue, EncodedList), encodeList(TList, MapKeysList, MapValuesList, EncodedValue).

%%%%% RULE: consecutiveCount 
%% not done yet
%  Add the rule(s) for part c below 
% base case: where there is only one element in the list the %program will terminate counting
consecutiveCount([H],0).

% recursive case: increment counter when consecutive elements %are equal
consecutiveCount([H,W|T],Count) :- H=W, consecutiveCount([W|T],N1), Count is N1+1.

% recursive case: the counter does not increment when %consecutive elements are not equal
consecutiveCount([H,W|T],Count) :- not(H=W), consecutiveCount([W|T],Count).

%%%%% RULE: splitOnInt
%  Add the rule(s) for part d below 
% partially works

% split of an empty list is two empty lists
splitOnInt([], _, [], []).

% prodeuces list of integers greater than the given value
splitOnInt([H1|T1], Value, [H2|T2], [_H3|T3]) :- H1 > Value, H2 = H1, splitOnInt(T1, Value, T2, T3).

% 
% splitOnInt([H1|T1], Value, [H1|T2], T3) :- H1 > Value, splitOnInt(T1, Value, T2, T3).

% produces list of integers smaller than the given value
splitOnInt([H1|T1], Value, [_H2|T2], [H3|T3]) :- H1 < Value, H3 = H1, splitOnInt(T1, Value, T2, T3).



%%%%% RULE: incAverage
% Add the rule(s) for part e below

%% incAverage uses predefined predicates sum to calculate the sumation and length  to find the number of element of the given list to calculate the average

incAverage([H|T], Average, NumElements) :- length([H|T], L), NumElements is L, sum([H|T], S), Average is (S//L).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
