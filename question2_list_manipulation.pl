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
%  Add the rule(s) for part c below 


%%%%% RULE: splitOnInt
%  Add the rule(s) for part d below 

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


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
