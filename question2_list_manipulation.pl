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


%%%%% RULE: incAverage
% Add the rule(s) for part e below


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
