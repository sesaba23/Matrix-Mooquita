Watch out!!! There is an issue found by one user! It doesn't work correctly with this type of matrix:
0100
1111
1111
1111

The max dimen given by my solution is 4, In fact the correct answer should be 12 (4x3). 
I am trying to fix it. Please, wait a few days for the solution.
If you want to help me, get in touch with me!


First of all, I tried to implement a solution iterating over all ‘1s’ elements of the array looking for surrounding elements equal to ‘1’. 
I attach a hand-made diagram to explain this and what it follows.

After think about another few alternatives with such a difficult implementation, I realized that I had to start for the beginning: make it simple.

Which is the easiest matrix (apart from the one element matrix) to test sub-matrix dimension? 
In fact, it is one row matrix. Do not mind its dimension, 1x2, 1x5 or 1x1000. So if you have a [001110] matrix (1x6) you need to iterate through
elements from 0 to 5. If you get one '1' you must increment a temporal variable (for example 'temp_var'). 
If you get a '0' you need to reset 'temp_var' to 0 just after save its value in another variable (for example 'var')
only if the 'temp_var' is greater than the previous stored value in ‘var’. 
Hence, when you finish to iterate through the array, you get the maximum sub-matrix dimension stored in 'var'!!!
Now if you think in a 1 column matrix in the same way as before, for example a (6x1) you can follow the same method to get the maximum dimension. 

In fact, why don’t use the same method in a(nxm) matrix? First, we can calculate the maximum dimension of the first row.
Then, when can go through every ‘j’ element of the second row ‘i’, summing up every (i, j-1) value if (i, j) value equals ‘1’ and storing this sum
in the (I,j) element. Otherwise set (i, j) to ‘0’. After iterate over al ‘j’ elements we can get the maximum sub-array temporally dimension 
multiplying the element ‘j’ with the maximum value by the number of times this value appears in that row pushing the value in an auxiliary array.
We can follow the same criteria in the others rows. 
After iterate over all the rows of the array, we just need to get the maximum sub-array dimension looking for the maximum value in the auxiliary array.

Regarding memory usage and which solution is faster, as you can see executing m.rb file the time used by loop for is a very few ms slower, 
but only in big arrays of more than 1000 columns and rows. I think it is because iterator methods of the enumeranble module are made much more efficiency
following Ruby methodology about blocks and yielding. 
Taking about memory usage I have not found almost any difference, maybe because the use of the cpu is insignificant with this example.
