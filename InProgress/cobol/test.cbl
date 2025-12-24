       >>SOURCE FORMAT FREE
       IDENTIFICATION DIVISION.
       PROGRAM-ID. READLINES.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO "test.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
       01 INPUT-RECORD PIC X(80).
       
       WORKING-STORAGE SECTION.
       01 EOF-FLAG     PIC X VALUE 'N'.
       01 LINE-COUNT   PIC 9(3) VALUE 0.
       01 I            PIC 9(2).
       01 J            PIC 9(2).
       
       01 ALL-LINES.
          05 LINE-ENTRY OCCURS 100 TIMES.
             10 LINE-LEN   PIC 9(2).
             10 LINE-DATA  PIC X(80).
       
       PROCEDURE DIVISION.
       MAIN.
           OPEN INPUT INPUT-FILE
       
           PERFORM UNTIL EOF-FLAG = 'Y'
               READ INPUT-FILE
                   AT END
                       MOVE 'Y' TO EOF-FLAG
                   NOT AT END
                       PERFORM STORE-LINE
               END-READ
           END-PERFORM
       
           CLOSE INPUT-FILE
       
           PERFORM DISPLAY-LINES
       
           STOP RUN.
       
       STORE-LINE.
           IF LINE-COUNT >= 100
               DISPLAY "ERROR: TOO MANY LINES"
               STOP RUN
           END-IF
       
           ADD 1 TO LINE-COUNT
           MOVE INPUT-RECORD TO LINE-DATA(LINE-COUNT)
       
           *> Calculate actual line length (trim trailing spaces)
           MOVE 80 TO LINE-LEN(LINE-COUNT)
           PERFORM VARYING I FROM 80 BY -1 UNTIL I = 0
               IF LINE-DATA(LINE-COUNT)(I:1) NOT = SPACE
                   MOVE I TO LINE-LEN(LINE-COUNT)
                   EXIT PERFORM
               END-IF
           END-PERFORM.
       
       DISPLAY-LINES.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LINE-COUNT
               DISPLAY "LINE " I " (LEN=" LINE-LEN(I) "):"
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > LINE-LEN(I)
                   DISPLAY LINE-DATA(I)(J:1)
               END-PERFORM
           END-PERFORM.
       