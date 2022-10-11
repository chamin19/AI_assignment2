% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Mayra Mussarrat 
%%%%% NAME: Rudaba Syed 
%%%%% NAME: Camillia Amin
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% RULE: listLength
% Add the rule(s) for listLength below

listLength(ListTerm, Length) :- length_helper(ListTerm, 0, Length).

%%%%% RULE: divideList
% Add the rule(s) for divideList below

divideList(ListTerm, Num, FirstHalf, SecondHalf) :- listLength(ListTerm, Len), Num = Len//2, half(ListTerm, FirstHalf, SecondHalf, Num).

%%%%% RULE: mergeSortedLists
% Add the rule(s) for mergeSortedLists below
    
mergeSortedLists(F, empty_list, F).
mergeSortedLists(empty_list, S, S).
mergeSortedLists(SortedListTerm1, SortedListTerm2, MergedList) :- SortedListTerm1 = listTerm(Hf, Tf), SortedListTerm2 = listTerm(Hs, Ts), MergedList = listTerm(Hf, M), Hf =< Hs, mergeSortedLists(Tf, SortedListTerm2, M).
mergeSortedLists(SortedListTerm1, SortedListTerm2, MergedList) :- SortedListTerm1 = listTerm(Hf, Tf), SortedListTerm2 = listTerm(Hs, Ts), MergedList = listTerm(Hs, M), Hf > Hs, mergeSortedLists(Ts, SortedListTerm1, M).

    


%%%%% Helpers
% Add any additional helpers below

length_helper(empty_list, Accumulator, Accumulator).
length_helper(listTerm(_, Remaining), Accumulator, Length) :- Accumulator1 is Accumulator + 1, length_helper(Remaining, Accumulator1, Length).

half(ListTerm, empty_list, ListTerm, 0).
half(listTerm(Head, Tail), listTerm(Head, Tail1), A, Num) :- Num > 0, Num1 is Num-1, half(Tail, Tail1, A, Num1).

    


%%%%% RULE: mergeSort
% Add the rule(s) for mergeSort below

mergeSort(empty_list, empty_list).
mergeSort(listTerm(E, empty_list), listTerm(E, empty_list)).
mergeSort(ListTerm, SortedListTerm) :- ListTerm = listTerm(_, listTerm(_,_)), SortedListTerm = listTerm(_, listTerm(_,_)), divideList(ListTerm, Num, FirstHalf, SecondHalf), mergeSort(FirstHalf, FirstHalfSort), mergeSort(SecondHalf, SecondHalfSort), mergeSortedLists(FirstHalfSort, SecondHalfSort, SortedListTerm).


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
