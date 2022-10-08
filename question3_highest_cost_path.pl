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

% append two lists together
appendList([ ],List,List). 
appendList([X | List1],List2,[X | Result]) :- appendList(List1,List2,Result). 

% find maximum in list
maxim([Max | []], Max).
maxim([Head, Body | Tail], Max) :- Head >= Body, maxim([Head | Tail], Max).
maxim([Head, Body | Tail], Max) :- Head < Body, maxim([Body | Tail], Max).

nodeHead(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), Head) :- Head = Name.

% find maxnode
maxNode(LCost, Left, MCost, Middle, RCost, Right, MaxCost, MaxBranch, MaxNode) :- LCost >= MCost, LCost >= RCost, MaxCost = LCost, nodeHead(Left, LNode), MaxBranch = Left, MaxNode = LNode.
maxNode(LCost, Left, MCost, Middle, RCost, Right, MaxCost, MaxBranch, MaxNode) :- RCost >  MCost, RCost >  LCost, MaxCost = RCost, nodeHead(Right, RNode), MaxBranch = Right, MaxNode = RNode.
maxNode(LCost, Left, MCost, Middle, RCost, Right, MaxCost, MaxBranch, MaxNode) :- MCost >  RCost, MCost >  LCost, MaxCost = MCost, nodeHead(Middle, MNode), MaxBranch = Middle, MaxNode = MNode.

%%%%% RULE: highestCostPath
% Add the rule(s) for highestCostPath below

highestCostPath(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), Cost, List) :- 
costPaths(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), 0, [], [],[]).

costPaths(tree3(Name, 0, none, 0, none, 0, none), Cost, List, Costs, Lists) :- 
write([Cost, Name | List]).

costPaths(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), Cost, List, Costs, Lists) :-
(Left=none ; C1 is LCost + Cost, costPaths(Left, C1, [ Name | List], Costs, Lists)), nl,
(Middle=none ; C2 is MCost + Cost, costPaths(Middle, C2, [ Name | List], Costs, Lists)), nl,
(Right=none ; C3 is RCost + Cost, costPaths(Right, C3, [ Name | List], Costs, Lists)), nl.

%%%%% TESTS
% Below is a test tree, based on the diagram in the assignment
% You can use it in a query as follows:
%
% ?- testTree(1, X), highestCostPath(X, Cost, Path).
%
% You may also add additional tree below for testing in this way, though we will not mark them.

testTree(2, tree3(none,0,none,0,none,0,none)).

%          a   
%    1/   2|   \3
%    b     c    d
testTree(3, tree3(a, 1,tree3(b,0,none,0,none,0,none), 2,tree3(c,0,none,0,none,0,none), 3,tree3(d,0,none,0,none,0,none))).

testTree(1, 
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