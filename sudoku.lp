% Domains
row(1..9).
col(1..9).
num(1..9).

% Exactly one number in each cell
1 { sudoku(X,Y,N) : num(N) } 1 :- row(X), col(Y).

% Givens
:- initial(X,Y,N), not sudoku(X,Y,N).

% Row constraint: same number can't appear twice in a row
% (using ordering to avoid comparing a pair twice)
:- sudoku(X,Y1,N), sudoku(X,Y2,N), col(Y1), col(Y2), Y1 < Y2.

% Column constraint: same number can't appear twice in a column
:- sudoku(X1,Y,N), sudoku(X2,Y,N), row(X1), row(X2), X1 < X2.

subgrid(X,Y,G) :-
    row(X), col(Y),
    GX = (X-1) / 3,
    GY = (Y-1) / 3,
    G  = GX*3 + GY + 1.

% Subgrid constraint: same number can't appear twice in a subgrid
% Case A: different rows
:- subgrid(X1,Y1,G), subgrid(X2,Y2,G),
   sudoku(X1,Y1,N), sudoku(X2,Y2,N),
   X1 < X2.

% Case B: same row, different columns
:- subgrid(X,Y1,G), subgrid(X,Y2,G),
   sudoku(X,Y1,N), sudoku(X,Y2,N),
   Y1 < Y2.

% *! Only show sudoku/3
#show sudoku/3.
