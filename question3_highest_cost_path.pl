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

%%%%% Helper Programs
% Put any helper programs in the space below

%finds the head and tail of a list
findHeadTail([Head | Tail],H,T) :- H = Head, T = Tail.

% finds the maximum path between 3 paths
maxCost([H1 | L1],[H2 | L2],[H3 | L3],Result) :- 
(not(L1 = [none]), H1 >= H2, H1 >= H3, Result = [H1 | L1]);
(not(L2 = [none]), H2 >  H1, H2 >  H3, Result = [H2 | L2]); 
(not(L3 = [none]), H3 >  H1, H3 >  H2, Result = [H3 | L3]).

% reverses list
reverseList(L1, L2) :- revAux(L1, [ ], L2).
revAux([ ], L, L).
revAux([H|L1], L2, L3) :- revAux(L1, [H|L2], L3).

% recursive program that finds the path with the longest weight 
costPaths(tree3(Name, 0, none, 0, none, 0, none), Cost, List, Costs, Lists) :- 
reverseList([Name | List], RevList),
Costs = [Cost | RevList].

costPaths(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), Cost, List, Costs, Lists) :-
C1 is LCost + Cost, C2 is MCost + Cost, C3 is RCost + Cost, 
(Left=none, Costs1=[0,none]   ; costPaths(Left, C1, [ Name | List ], Costs1, Lists1)), 
(Middle=none, Costs2=[0,none] ; costPaths(Middle, C2, [ Name | List ], Costs2, Lists2)), write('\n2 '), write(Costs2),
(Right=none, Costs3=[0,none]  ; costPaths(Right, C3, [ Name | List ], Costs3, Lists3)), write('\n3 '), write(Costs3),
maxCost(Costs1,Costs2,Costs3,Result), Lists = Result,
write('\n1 '), write(Costs1), write(' Left: '), write(Left), 
write(' Middle: '), write(Middle),
write(' Right: '), write(Right),
write('\nLists: '),write(Lists), nl.  

%%%%% RULE: highestCostPaths
% Add the rule(s) for highestCostPath below
highestCostPath(tree3(Name, 0, none, 0, none, 0, none), Cost, List) :- Cost = 0, not(Name=none), List = [Name].
highestCostPath(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), Cost, List) :- 
write('\nA\n'),(Left=none, Lists1=[0,none]  ; costPaths(Left, LCost, [Name], Costs1, Lists1)),
write('\nB\n'),(Middle=none, Lists2=[0,none]; costPaths(Middle, MCost, [Name], Costs2, Lists2)),
write('\nC\n'),(Right=none, Lists3=[0,none] ; costPaths(Right, RCost, [Name], Costs3, Lists3)),

%if Lists has not been assigned, make Lists = Costs: 
Lists1 = Costs1, Lists2 = Costs2, Lists3 = Costs3,
write('\nL1: '), write(Lists1), write('\nL2: '), write(Lists2), write('\nL3: '), write(Lists3),
maxCost(Lists1,Lists2,Lists3,Result), 
findHeadTail(Result,H,T), Cost = H, List = T.

%%%%% TESTS
% Below is a test tree, based on the diagram in the assignment
% You can use it in a query as follows:
%
% ?- testTree(1, X), highestCostPath(X, Cost, Path).
%
% You may also add additional tree below for testing in this way, though we will not mark them.

testTree(6, tree3(a,0,none,0,none,0,none)).


% works------------------------
% ?- testTree(1, X), highestCostPath(X, Cost, Path).
testTree(1, tree3(none,0,none,0,none,0,none)).

% works------------------------
% ?- testTree(2, X), highestCostPath(X, Cost, Path).
testTree(2, tree3(a, 1,tree3(b,0,none,0,none,0,none), 2,tree3(c,0,none,0,none,0,none), 3,tree3(d,0,none,0,none,0,none))).
%          a   
%    1/   2|   \3
%    b     c    d

% works------------------------
% ?- testTree(4, X), highestCostPath(X, Cost, Path).
testTree(4, 
        tree3(a, 
                2, tree3(b, 0,none, 1, tree3(e, 0,none, 0,none, 0,none), 0,none),
                6, tree3(c, 2,tree3(h, 0,none, 0,none, 0,none), 0,none, 0,none),
                3, tree3(d, 0, none, 4, tree3(f, 0,none, 0,none, 0,none), 2, tree3(g, 0,none, 0,none, 0,none))                
        )
).
%               a
%       2/      |6      \3
%       b       c        d
%      1|       |2      4|  \2
%       e       h        f   g


% works------------------------
% ?- testTree(3, X), highestCostPath(X, Cost, Path).
testTree(3, 
        tree3(a, 
                2, tree3(b, 0,none, 1, tree3(e, 0,none, 0,none, 0,none), 0,none),
                6, tree3(c, 0,none, 0,none, 0,none),
                3, tree3(d, 0, none, 4, tree3(f, 0,none, 0,none, 0,none), 2, tree3(g, 0,none, 0,none, 0,none))                
        )
).
%               a
%       2/      |6      \3
%       b       c        d
%      1|               4|  \2
%       e               f    g

% does not work------------------------
% ?- testTree(5, X), highestCostPath(X, Cost, Path).
testTree(5, 
    tree3(a,  % The root node has name a
            2, tree3(b, % Left child of a is b and can be reached with cost 2 
                    3, tree3(e,0, none, 0, none, 0, none),   % Left child of b is e. It is a leaf node
                    5, tree3(f, 0, none, 0, none, 0, none),   % Middle child of b is f. It is a leaf node
                    0, none  % There is no right childe of b
                    ),
            3, tree3(c, 0, none, 0, none, 0, none),  % Middle child of a is c. It is a leaf node
            1, tree3(d,   % Right child of a is d
                    2, tree3(g, 0, none, 0, none,   % Left child of d is g. It has no left or middle child
                            1, tree3(h, 0, none, 0, none, 0, none)),   % The right child of g is h. It is a leaf node
                    0, none, 0, none  % d has no middle or right children
                    )
        )
).

%%%%% END
% DO NOT PUT ANY LINES BELOW
%highestCostPath(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), Cost, List) :- 
%write('\nA\n'),(Left=none, Lists1=[0,none]  ; costPaths(Left, LCost, [Name], Costs1, Lists1)),
%write('\nB\n'),(Middle=none, Lists2=[0,none]; costPaths(Middle, MCost, [Name], Costs2, Lists2)),
%write('\nC\n'),(Right=none, Lists3=[0,none] ; costPaths(Right, RCost, [Name], Costs3, Lists3)),
%if Lists has not been assigned, make Lists = Costs: 
%Lists1 = Costs1, Lists2 = Costs2, Lists3 = Costs3,
%write('\nL1: '), write(Lists1), write('\nL2: '), write(Lists2), write('\nL3: '), write(Lists3),
%write('\nerror here '),maxCost(Lists1,Lists2,Lists3,Result), 


%highestCostPath(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), Cost, List) :- 
%costPaths(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), 0, [], Costs,Lists),
%findHeadTail(Lists,H,T), Cost = H, List = T,
%write('\n---final---:\n'), write(Cost), write(List).