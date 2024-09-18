/* Rexx Listit3 exec (lab 10, part 2) */
Parse Upper Arg dsn                          /* get data set name    */
Do While dsn = ''                            /* is it null?          */
   Say "Enter data set name:"                /* yup. Prompt them for */
   Parse Upper Pull dsn                      /* new data set name    */
End /* While */
msg = SYSDSN(dsn)                            /* is data set okay?    */
If msg = 'OK' Then                           /* yup, so go ahead     */
   Do
      indd = Stream(dsn,'C','OPEN')          /* open input stream    */
      Do i = 1 While Lines(indd)             /* loop thru dsn recs   */
         rec.i = Linein(indd)                /* read each line       */
      End i
      rec.0 = i - 1                          /* number of lines read */
      Do j = 1 To rec.0                      /* loop through vars    */
         x = Lineout(,Strip(rec.j,'T'))      /* write output to term */
         If x \= 0 Then Call Error 'Lineout' x/* problem? call error */
      End j
   End /* Then Do */
Else
   Call Error "SYSDSN" msg                   /* problem with SYSDSN  */
Exit 0                                       /* bye, rc=0            */
Error:                                       /* my error routine     */
Parse Arg xfcn xmsg                          /* get passed arguments */
Say "Error processing data set:" dsn         /* general error message*/
If xfcn = 'SYSDSN' Then                      /* SYSDSN error?        */
   Say "Error from SYSDSN is:" xmsg          /* say SYSDSN message   */
If xfcn = 'Lineout' Then                     /* Lineout() error?     */
   Say "Error from Lineout function."        /* say Lineout message  */
Exit 99                                      /* bye, rc=99           */