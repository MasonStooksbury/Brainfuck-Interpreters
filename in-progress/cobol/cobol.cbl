       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL-BF-INTERPRETER.


       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
              FILE-CONTROL.
              SELECT PROGRAM-FILE ASSIGN TO 'test.txt'
              ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
           FD PROGRAM-FILE.
           01 PROGRAM-BYTE PIC X.
               88 END-OF-PROGRAM-FILE VALUES HIGH-VALUES.

       WORKING-STORAGE SECTION.
      * Max size of memory array is a 5 digit number
           01 MAX-MEMORY CONSTANT 10.
      * Memory array
           01 DATA-BYTE-UPPER-BOUND CONSTANT 255.
           01 DATA-BYTE-LOWER-BOUND CONSTANT 0.
           01 MEMORY-TABLE.
               02 MEMORY-ARR PIC 9(1) VALUE 0 OCCURS MAX-MEMORY TIMES
               INDEXED BY X.
                   88 UPPER-BOUND-REACHED VALUE DATA-BYTE-UPPER-BOUND.
                   88 LOWER-BOUND-REACHED VALUE DATA-BYTE-LOWER-BOUND.

      * File pointer (can be a 5-digit number because of max memory)
           01 FILE-PTR PIC 9(5).
      * Memory pointer (can be a 5-digit number because of max memory)
           01 MEM-PTR PIC 9(5).

      * Array to keep track of loop start/end
           01 LOOP-STACK.
               05 WSA PIC 9(1) VALUE 0 OCCURS MAX-MEMORY TIMES.

       

       PROCEDURE DIVISION.
           MAIN-PROC.
               PERFORM TESTY VARYING X FROM 1 BY 1 UNTIL X > 3.
               STOP RUN.

           MAIN.
               DISPLAY MEMORY-TABLE.
               DISPLAY MEMORY-ARR(3).
           TESTY.
               DISPLAY MEMORY-ARR(X).

       END PROGRAM COBOL-BF-INTERPRETER.
