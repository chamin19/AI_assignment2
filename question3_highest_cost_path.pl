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
maxCost([H1 | L1],[H2 | L2],[H3 | L3],Result) :- not(L1 = [none]), H1 >= H2, H1 >= H3, Result = [H1 | L1].
maxCost([H1 | L1],[H2 | L2],[H3 | L3],Result) :- not(L2 = [none]), H2 >  H1, H2 >= H3, Result = [H2 | L2].
maxCost([H1 | L1],[H2 | L2],[H3 | L3],Result) :- not(L3 = [none]), H3 >  H1, H3 >  H2, Result = [H3 | L3].

% reverses list
reverseList(L1, L2) :- revAux(L1, [ ], L2).
revAux([ ], L, L).
revAux([H|L1], L2, L3) :- revAux(L1, [H|L2], L3).

% recursive program that finds the path with the longest weight 
costPaths(tree3(Name, 0, none, 0, none, 0, none), Cost, Path, ListA, ListB) :- 
reverseList([Name | Path], RevList),
ListA = [Cost | RevList].

costPaths(none, Cost, Path, ListA, ListB) :- ListA = [0,none].
costPaths(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), Cost, Path, ListA, ListB) :-
C1 is LCost + Cost, C2 is MCost + Cost, C3 is RCost + Cost, 
(costPaths(Left, C1, [ Name | Path ], ListA1, ListB1)), 
(costPaths(Middle, C2, [ Name | Path ], ListA2, ListB2)), 
(costPaths(Right, C3, [ Name | Path ], ListA3, ListB3)), 
maxCost(ListA1,ListA2,ListA3,Result), ListB = Result.  

%%%%% RULE: highestCostPaths
% Add the rule(s) for highestCostPath below
highestCostPath(tree3(Name, 0, none, 0, none, 0, none), Cost, Path) :- Cost = 0, not(Name=none), Path = [Name].
highestCostPath(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), Cost, Path) :- 
(costPaths(Left, LCost, [Name], ListA1, ListB1)),
(costPaths(Middle, MCost, [Name], ListA2, ListB2)),
(costPaths(Right, RCost, [Name], ListA3, ListB3)),
ListB1 = ListA1, ListB2 = ListA2, ListB3 = ListA3, 
maxCost(ListB1,ListB2,ListB3,Result), findHeadTail(Result,H,T), Cost = H, Path = T.

%%%%% TESTS
% Below is a test tree, based on the diagram in the assignment
% You can use it in a query as follows:
%
% ?- testTree(1, X), highestCostPath(X, Cost, Path).
%
% You may also add additional tree below for testing in this way, though we will not mark them.

testTree(1, tree3(none,0,none,0,none,0,none)).
testTree(6, tree3(a,0,none,0,none,0,none)).
testTree(2, tree3(a, 1,tree3(b,0,none,0,none,0,none), 2,tree3(c,0,none,0,none,0,none), 3,tree3(d,0,none,0,none,0,none))).
%          a   
%    1/   2|   \3
%    b     c    d

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