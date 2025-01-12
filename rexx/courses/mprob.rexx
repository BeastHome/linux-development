/* Rexx exec mprob (lab 15) */
Parse Upper Arg probs                    /* accept input arguments   */
Do Until Length(probs) = 0               /* loop through problems    */
   total = 0                             /* initialize variable      */
   Parse Var probs exec nums ':' probs   /* extract each set of nums */
   '%'exec nums                          /* invoke requested exec    */
End /* until */
Exit 0