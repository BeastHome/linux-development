/* Rexx  12

  Fill in the answers. You may run this exec at any time to see
  your answers.

  When you wish to compare answers, run %PARSCHK.

*/

s1 = 'Themholepispinqonepwallmonly'
s2 = 'When in doubt, quote it'
s3 = 'An exec in time saves nine'
s4 = 'All that glitters is not REXX'
s5 = Time() Date()

Say "1. From the following expression, put the second word into A,"
Say "   the fourth word into B and the fifth word into C."

                                             /* code a template */
    Parse Value Translate(s1,,'mpq')  With  . a . b c .
  Say a b c

Say "2. From the variable S2 put all data before the comma into D"
Say "   and all data after the comma into E."
                                            /* code a template   */
    Parse Var s2  d ',' e
  Say d
  Say e

Say "3. From the variable S2, put columns 18 and 19 into F."

                                            /* code a template   */
    Parse Var s2  18 f 20
  Say f

Say "4. Parse the variable S4 based on the current content of the"
Say "   variable F. Put everything after that match point into G."

                                            /* code a template   */
    Parse Var s4  (f) g
  Say g

Say "5. From the variable s5, put the hours into H, minutes into M,"
Say "   and seconds into S."

                                            /* code a template   */
    Parse Var s5 h ':' m ':' s .
  Say 'hours='h', minutes='m', seconds='s

Say "6. From S3, put the first 21 columns into I, and"
Say "   columns 14 and 15 into J."

                                            /* code a template   */
    Parse Var s3  i +21 14 j +2
  Say i j

Say "7. From S5, put the third word into K and the second word into L."

                                            /* code a template   */
    Parse Var s5  . l k .
  Say k l

Say "8. From variable S4, put the 6 columns preceding the 's' into N."
                                            /* code a template   */
    Parse Var s4   's' -6 n +6
  Say n
Exit 0