%let pgm=utl-simple-eleganct-matrix-operations-in-r;

   Smple eleganct matrix operations in r

   Three Parts
       1 row column and full matix operations
       2 matrix functions
       3 matrix algebra regression

SOAPBOX ON

Why R matrix language ca easily solves so may problems

Probably because R has roots in the Bell Labs S language.

 R is much more mature tha Python. No nned for Python iloc in R?
 S was singularly developed by John Chambers and others at Bell Laboratories

SOAPBOX OFF

https://github.com/rogerjdeangelis/utl_datastep_array_row_col_reductions_sumOf
https://github.com/rogerjdeangelis/utl-datastep-in-memory-matrix-and-submatrix-row-and-column-reductions-summations-fcmp
https://github.com/rogerjdeangelis/utl-datastep-matrix-column-and-row-reductions

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

> mat      # matrix
      x  y  z
[1,] 11 12 13
[2,] 21 22 23
[3,] 31 32 33

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%utl_rbegin;
parmcards4;
mat <- as.matrix(read.table(header = TRUE, text = "
x y z
11 12 13
21 22 23
31 32 33
"))
str(mat) # matrix structure
mat      # matrix
mat[2,2] # extract one element
mat[1,]  # 1st row
mat[,2]  # 2nd column
mat[1:2,1:2] # upper 2x2 matrix
mat[c(1,3), c(2,3)] # row 1 and 3 column 2 and 3;
mat[1, , drop = FALSE] # Retains row dimension as a matrix
mat[, 2, drop = FALSE] # Retains column dimension as a matrix
sum(mat) # sum all elements
rowSums(mat) # sum rows of a matrix
colSums(mat) # sum columns of a matrix
sum(mat[1,]) # sum row 1
sum(mat[,1]) # sum column 1
mat[,c('x','z')] # extract columns x and z
mat[1:2,c('x','y')] # upper left 2 x 2 matrix
mat[c(1,3),c('x','z')] # extract the four corners
mat[,-1] # drop column 3
mat[-1,-1] # lower right 2x2 matrix
sqrt(mat) # sqrt of all elements
cbind(mat,tot=rowSums(mat)) # add rowsums to matrix
sqrt(mat) * sqrt(mat) # elements by element mutiplication sqrt(mat) * sqrt(mat)
mat %*% t(mat) # dot product
nonsingular=sqrt(mat) # make nonsigular rows of mat are not linearly independent
solve(nonsingular) # inverse of mat
det(nonsingular) # determinant
round(solve(nonsingular) %*% nonsingular) # identity matrix
X <- cbind(1, sqrt(mat[,1])) # regression design x matrix independent variables
X
Y <- rowSums(mat) # dependent variable
Y
beta <- solve(t(X) %*% X) %*% t(X) %*% Y # beta regression coeficients
beta
y_pred <- X %*% beta # predicted and observed values
cbind (y_pred,Y)
;;;;
%utl_rend;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  /*                                                                                                                    */
/*             _                                                                       _   _                              */
/*    ___ ___ | |_   _ _ __ ___  _ __    _ __ _____      __  ___  _ __   ___ _ __ __ _| |_(_) ___  _ __  ___              */
/*   / __/ _ \| | | | | `_ ` _ \| `_ \  | `__/ _ \ \ /\ / / / _ \| `_ \ / _ \ `__/ _` | __| |/ _ \| `_ \/ __|             */
/*  | (_| (_) | | |_| | | | | | | | | | | | | (_) \ V  V / | (_) | |_) |  __/ | | (_| | |_| | (_) | | | \__ \             */
/*   \___\___/|_|\__,_|_| |_| |_|_| |_| |_|  \___/ \_/\_/   \___/| .__/ \___|_|  \__,_|\__|_|\___/|_| |_|___/             */
/*                                                               |_|                                                      */
/*  */                                                                                                                    */
/*                                                                                                                        */
/*  > mat      # matrix Note matrix is sigular                                                                            */
/*        x  y  z                                                                                                         */
/*  [1,] 11 12 13                                                                                                         */
/*  [2,] 21 22 23                                                                                                         */
/*  [3,] 31 32 33                                                                                                         */
/*                                                                                                                        */
/*  > mat[2,2] # extract one element                                                                                      */
/*   y                                                                                                                    */
/*  22                                                                                                                    */
/*                                                                                                                        */
/*  > mat[1,]  # 1st row                                                                                                  */
/*   x  y  z                                                                                                              */
/*  11 12 13                                                                                                              */
/*                                                                                                                        */
/*  > mat[,2]  # 2nd column                                                                                               */
/*  [1] 12 22 32                                                                                                          */
/*                                                                                                                        */
/*  > mat[1:2,1:2] # upper left 2x2 matrix                                                                                */
/*        x  y                                                                                                            */
/*  [1,] 11 12                                                                                                            */
/*  [2,] 21 22                                                                                                            */
/*                                                                                                                        */
/*  > mat[, 2, drop = FALSE] # Retains column dimension as a matrix                                                       */
/*        y                                                                                                               */
/*  [1,] 12                                                                                                               */
/*  [2,] 22                                                                                                               */
/*  [3,] 32                                                                                                               */
/*                                                                                                                        */
/*  > mat[1, , drop = FALSE] # Retains row dimension as a matrix                                                          */
/*        x  y  z                                                                                                         */
/*  [1,] 11 12 13                                                                                                         */
/*                                                                                                                        */
/*  > mat[c(1,3), c(2,3)] # row 1 and 3 column 2 and 3;                                                                   */
/*        y  z                                                                                                            */
/*  [1,] 12 13                                                                                                            */
/*  [2,] 32 33                                                                                                            */
/*                                                                                                                        */
/*  > sum(mat) # sum all elements                                                                                         */
/*  [1] 198                                                                                                               */
/*                                                                                                                        */
/*  > rowSums(mat) # sum rows od a matrix                                                                                 */
/*  [1] 36 66 96                                                                                                          */
/*                                                                                                                        */
/*  > colSums(mat) # sum columns od a matrix                                                                              */
/*   x  y  z                                                                                                              */
/*  63 66 69                                                                                                              */
/*                                                                                                                        */
/*  > sum(mat[1,]) # sum row 1                                                                                            */
/*  [1] 36                                                                                                                */
/*                                                                                                                        */
/*  > sum(mat[,1]) # sum column 1                                                                                         */
/*  [1] 63                                                                                                                */
/*                                                                                                                        */
/*  > mat[,c('x','z')] # extract columns x and z                                                                          */
/*        x  z                                                                                                            */
/*  [1,] 11 13                                                                                                            */
/*  [2,] 21 23                                                                                                            */
/*  [3,] 31 33                                                                                                            */
/*                                                                                                                        */
/*  > mat[1:2,c('x','y')] # upper left 2 x 2 matrix                                                                       */
/*        x  y                                                                                                            */
/*  [1,] 11 12                                                                                                            */
/*  [2,] 21 22                                                                                                            */
/*                                                                                                                        */
/*  > mat[c(1,3),c('x','z')] # extract the four corners                                                                   */
/*        x  z                                                                                                            */
/*  [1,] 11 13                                                                                                            */
/*  [2,] 31 33                                                                                                            */
/*                                                                                                                        */
/*  > mat[,-1] # drop column 3                                                                                            */
/*        y  z                                                                                                            */
/*  [1,] 12 13                                                                                                            */
/*  [2,] 22 23                                                                                                            */
/*  [3,] 32 33                                                                                                            */
/*                                                                                                                        */
/*  > mat[-1,-1] # lower right 2x2 matrix                                                                                 */
/*        y  z                                                                                                            */
/*  [1,] 22 23                                                                                                            */
/*  [2,] 32 33                                                                                                            */
/*                                                                                                                        */
/*  > cbind(mat,tot=rowSums(mat)) # add rowsums to matrix                                                                 */
/*        x  y  z tot                                                                                                     */
/*  [1,] 11 12 13  36                                                                                                     */
/*  [2,] 21 22 23  66                                                                                                     */
/*  [3,] 31 32 33  96                                                                                                     */
/*                                                                                                                        */
/*  /*               _        _         __                  _   _                                                         */
/*   _ __ ___   __ _| |_ _ __(_)_  __  / _|_   _ _ __   ___| |_(_) ___  _ __  ___                                         */
/*  | `_ ` _ \ / _` | __| `__| \ \/ / | |_| | | | `_ \ / __| __| |/ _ \| `_ \/ __|                                        */
/*  | | | | | | (_| | |_| |  | |>  <  |  _| |_| | | | | (__| |_| | (_) | | | \__ \                                        */
/*  |_| |_| |_|\__,_|\__|_|  |_/_/\_\ |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/                                        */
/*                                                                                                                        */
/*  */                                                                                                                    */
/*                                                                                                                        */
/*  > sqrt(mat) # sqrt of all elements                                                                                    */
/*              x        y        z                                                                                       */
/*  [1,] 3.316625 3.464102 3.605551                                                                                       */
/*  [2,] 4.582576 4.690416 4.795832                                                                                       */
/*  [3,] 5.567764 5.656854 5.744563                                                                                       */
/*                                                                                                                        */
/*  > sqrt(mat) * sqrt(mat) # elements by element mutiplication sqrt(mat) * sqrt(mat)                                     */
/*        x  y  z                                                                                                         */
/*  [1,] 11 12 13                                                                                                         */
/*  [2,] 21 22 23                                                                                                         */
/*  [3,] 31 32 33                                                                                                         */
/*                                                                                                                        */
/*  > mat %*% t(mat) # dot product                                                                                        */
/*       [,1] [,2] [,3]                                                                                                   */
/*  [1,]  434  794 1154                                                                                                   */
/*  [2,]  794 1454 2114                                                                                                   */
/*  [3,] 1154 2114 3074                                                                                                   */
/*                                                                                                                        */
/*  > nonsingular=sqrt(mat) # make nonsigular. Rows of mat are not linearly independent                                   */
/*  > solve(nonsingular) # inverse of mat                                                                                 */
/*         [,1]      [,2]      [,3]                                                                                       */
/*  x -571.7534  1534.493 -922.2082                                                                                       */
/*  y 1166.0797 -3160.630 1906.7580                                                                                       */
/*  z -594.1192  1625.107 -983.6457                                                                                       */
/*                                                                                                                        */
/*  > det(nonsingular) # determinant                                                                                      */
/*  [1] 0.0003234484                                                                                                      */
/*                                                                                                                        */
/*  > round(solve(nonsingular) %*% nonsingular) # identity matrix                                                         */
/*    x y z                                                                                                               */
/*  x 1 0 0                                                                                                               */
/*  y 0 1 0                                                                                                               */
/*  z 0 0 1                                                                                                               */
/*                                                                                                                        */
/*  /*                                _                                                                                   */
/*   _ __ ___  __ _ _ __ ___  ___ ___(_) ___  _ __                                                                        */
/*  | `__/ _ \/ _` | `__/ _ \/ __/ __| |/ _ \| `_ \                                                                       */
/*  | | |  __/ (_| | | |  __/\__ \__ \ | (_) | | | |                                                                      */
/*  |_|  \___|\__, |_|  \___||___/___/_|\___/|_| |_|                                                                      */
/*            |___/                                                                                                       */
/*  */                                                                                                                    */
/*                                                                                                                        */
/*  > X <- cbind(1, sqrt(mat[,1])) # regression design x matrix independent variables                                     */
/*  > X                                                                                                                   */
/*       [,1]     [,2]                                                                                                    */
/*  [1,]    1 3.316625                                                                                                    */
/*  [2,]    1 4.582576                                                                                                    */
/*  [3,]    1 5.567764                                                                                                    */
/*                                                                                                                        */
/*  > Y <- rowSums(mat) # dependent variable                                                                              */
/*  > Y                                                                                                                   */
/*  [1] 36 66 96                                                                                                          */
/*                                                                                                                        */
/*  > beta <- solve(t(X) %*% X) %*% t(X) %*% Y # beta regression coeficients                                              */
/*  > beta                                                                                                                */
/*            [,1]                                                                                                        */
/*  [1,] -53.02859                                                                                                        */
/*  [2,]  26.51568                                                                                                        */
/*                                                                                                                        */
/*  > y_pred <- X %*% beta # predicted and observed values                                                                */
/*  > cbind (y_pred,Y)                                                                                                    */
/*                                                                                                                        */
/*       Predicted   Y                                                                                                    */
/*  [1,] 34.91398   36                                                                                                    */
/*  [2,] 68.48153   66                                                                                                    */
/*  [3,] 94.60448   96                                                                                                    */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
