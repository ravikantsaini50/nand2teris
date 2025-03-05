// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.
// Mult.asm - Multiplies R0 and R1 using repetitive addition

@R2
M=0           // Initialize R2 to 0 (to store the result)

@R0
D=M          // Load R0 into D (multiplier)
@END
D;JEQ        // If R0 is 0, jump to END (result remains 0)

@i
M=0          // Initialize i = 0 (loop counter)

(LOOP)
  @i
  D=M
  @R0
  D=D-M      // Compare i with R0
  @END
  D;JEQ      // If i == R0, exit loop

  @R2
  D=M
  @R1
  D=D+M      // R2 = R2 + R1
  @R2
  M=D

  @i
  M=M+1      // Increment i
  @LOOP
  0;JMP      // Repeat loop

(END)
@END
0;JMP        // Infinite loop to halt
