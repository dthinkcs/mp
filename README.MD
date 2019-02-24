8086 ASSEMBLY CODE REPO

DATA TRANSFER OPERATIONS 12
1. Transfer 10 bytes of data in data segment, where blocks are overlapping.
2. Transfer 5 words of data in data segment, where blocks are a). overlapping and
b).non-overlapping.
3. Exchange the contents of two arrays, where each array has 10 bytes of data in the data segment.
Additional exercises
1. Illustrate different addressing modes available in 8086 programming.
2. Write an Assembly Language Program to reverse the contents of an array of 10 words stored
in the data segment.

ARITHMETIC OPERATIONS: ADDITION AND SUBTRACTION 3
1. Add two 16 - bit hexadecimal numbers stored in registers and store the result in data segment
2. Add two 8 - bit decimal numbers stored in data segment and store the result in data segment
3. Add two 32 - bit hexadecimal numbers in data segment and store the result in data segment.
4. Subtract two 16 - bit numbers in memory locations and store the result in data segment
5. Subtract two 32 - bit numbers in data segment and store the result in data segment.
6. Subtract two 10 - byte numbers in data segment and store the result in data segment.
7. Repeat questions 3 - 6 for decimal numbers
8. Find the sum of 10 unsigned bytes in an array and store the result in data segment.
Additional Exercise:
Add twenty 2- digit decimal numbers stored in the data segment and store the decimal result in
data segment.

ARITHMETIC OPERATIONS: MULTIPLICATION AND DIVISION 4
1. Multiplication of
i. Two unsigned words
ii. Two signed bytes
iii. Two signed words
2. Division of
i. 16 - bit unsigned number by 8 - bit unsigned number
ii. 16 - bit signed number by 8-bit signed number
iii. 32 - bit unsigned number by 16 - bit unsigned number
iv. 32 - bit signed number by 16 - bit signed number.
3. Multiplication of 16 bit unsigned numbers by repetitive addition.
Additional exercises
1. Find the square of an unsigned TWO digit hexadecimal number
2. Find the cube of an unsigned TWO digit hexadecimal number





LOGICAL OPERATIONS 5
Write an Assembly Language Program to
1. Convert four digit BCD number to HEX.
2. Convert two digit number from HEX to BCD.
3. Convert four digit number from HEX to BCD.
Additional exercises
Write an Assembly Language Program
1. To check whether the given number is even or odd using logical instructions
2. To count the number of 1’s in the given binary 32 bit binary number store in the memory using
logical instructions.


PROCEDURES AND MACROS 6
1. GCD of two unsigned words using a2.
a. Macro
b. Procedure
GCD of four unsigned words using a
a. Macro which finds GCD of two unsigned words
b. Function which finds GCD of two unsigned words
LCM of two unsigned bytes.
LCM of four unsigned bytes using function which finds LCM of two unsigned bytes.
Factorial of unsigned byte using recursion
Additional exercises
1. Write an Assembly Language Program to compute the possible permutation and combination
to select ‘r’ objects out of ‘n’ objects (nP r , nC r ) using recursive factorial function.
2. Using procedure BCD_HEX which converts a 2-digit BCD into HEX, write an ALP to convert
4-digit BCD to HEX.

ARRAYS: Searching and Sorting 7
1. Linear search in an array of 10 unsigned
i. Bytes
ii. Words
2. Smallest number in an array of N bytes
3. Sorting of a). Unsigned Bytes b). a). Unsigned Words
c). Signed Bytes
d) Signed Words
Using
i. Selection sort
ii. Bubble sort
Additional exercises
Write an Assembly Language Program to perform
1. Binary search
2. Insertion sort
PROGRAMMING USING BIOS AND DOS SERVICES 8
Write an Assembly Language Program to
1. Input a character without echo and with echo and display the character in next line.
2. Prompt the user to input two 2-digit HEX numbers from the keyboard and display the sum
on the screen.
3. Repeat question 1 for decimal numbers.
4. Read a two-digit hexadecimal number from the keyboard and display its decimal
equivalent on the screen.
i) Use interrupt to read single character
ii) Use interrupt to read string
Additional exercises
Write an Assembly Language Program to
1. Accept an array of 10 unsigned hexadecimal numbers from the keyboard and display the
sorted array.
2. Accept an array of five hexadecimal numbers from the keyboard and display the GCD.
3. Right adjust each entered name to the right of the screen, one below the other.
4. Input 8 bit binary number from keyboard and display its decimal equivalent on the screen.
(Ex: If the input is 111111110 the result displayed is 254)


