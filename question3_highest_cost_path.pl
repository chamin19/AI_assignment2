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

% highCostPath(Tree, PathCost, PathList) 

% base case - tree is empty or has one node
highestCostPath(tree3(Name, LeftCost, none, MiddleCost, none, RightCost, none), PathCost, PathList) :- Left = none, Right = none, PathCost = 0, PathList=[Name].

% recursive case 
% highestCostPath(tree3(Name, LeftCost, Left, MiddleCost, Middle, RightCost, Right), PathCost, PathList) :- 



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