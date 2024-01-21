       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL-BF-INTERPRETER.


       DATA DIVISION.
           WORKING-STORAGE SECTION.
      * Max size of memory array is a 5 digit number
       01 MAX-MEMORY PIC 9(5) VALUE 10.
      * Memory array
       01 MEMORY-ARR.
           05 WS-A PIC 9(10) VALUE 0 OCCURS 10 TIMES.

      * File pointer
       01 FILE-PTR PIC 9(1).
      * Memory pointer
       01 MEM-PTR PIC 9(1).

      * Array to keep track of loop start/end
       01 LOOP-STACK.
           05 WS-A PIC 9(10) VALUE 0 OCCURS 10 TIMES.

       

       PROCEDURE DIVISION.
       MAIN-PROC.
           PERFORM MAIN
           DISPLAY MEMORY-ARR.
           STOP RUN.

       MAIN.
           DISPLAY MEMORY-ARR.

       END PROGRAM COBOL-BF-INTERPRETER.
