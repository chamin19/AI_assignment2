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
append([ ],List,List).
append([X | List1],List2,[X | Result]) :- append(List1,List2,Result). 

% find maximum in list
maxim([Max | []], Max).
maxim([Head, Body | Tail], Max) :- Head >= Body, maxim([Head | Tail], Max).
maxim([Head, Body | Tail], Max) :- Head < Body, maxim([Body | Tail], Max).

% find maxnode
maxNode(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), MaxCost, MaxNode) :- LCost >= MCost, LCost >= RCost, MaxCost = LCost, nodeHead(Left, Head), MaxBranch = Left, MaxNode = Head.
maxNode(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), MaxCost, MaxNode) :- RCost >  MCost, RCost >  LCost, MaxCost = RCost, nodeHead(Right, Head), MaxBranch = Right, MaxNode = Head.
maxNode(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), MaxCost, MaxNode) :- MCost >  RCost, MCost >  LCost, MaxCost = MCost, nodeHead(Middle, Head), MaxBranch = Middle, MaxNode = Head.

nodeHead(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), Head) :- Head is Name.

% highCostPath(Tree, PathCost, PathList) 

% base case - node has no children
highestCostPath(tree3(Name, LCost, none, MCost, none, RCost, none), Costs, Paths, PathCost, PathList).

% recursive case 
highestCostPath(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), PathCost, PathList) :- max(tree3(Name, LCost, Left, MCost, Middle, RCost, Right), MaxCost, MaxBranch, MaxNode), 
append([MaxNode], PathList, Result), Cost is MaxCost + PathCost, highestCostPath(MaxBranch,Cost,Result)).

%%%%% RULE: highestCostPath
% Add the rule(s) for highestCostPath below


%%%%% TESTS
% Below is a test tree, based on the diagram in the assignment
% You can use it in a query as follows:
%
% ?- testTree(1, X), highestCostPath(X, Cost, Path).
%
% You may also add additional tree below for testing in this way, though we will not mark them.

tree3(none,0,none,0,none,0,none)

%%%%% END
% DO NOT PUT ANY LINES BELOW