/* Rexx exec mavg (lab 14) */
Parse Upper Arg probs                    /* accept input problems    */
Do i = 1                                 /* loop through problems    */
   colonpos = Pos(':',probs)             /* find colons              */
   If colonpos= 0 Then                   /* no colon, only one prob  */
      Do
         Call Avg probs                  /* pass prob to avg         */
         Leave i                         /* we're done, get out      */
      End /* Then Do */
   Else
      Do
         prob = Substr(probs,1,colonpos - 1)  /* extract just nums   */
         Call Avg prob                        /* pass nums to avg    */
         probs = Substr(probs,colonpos + 1)   /* toss away used nums */
      End /* Else Do */
End i
Exit 0