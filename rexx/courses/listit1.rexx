/* Rexx exec to list data sets (lab 10, part 1) */
Parse Upper Arg dsn                         /* get the data set name */
Do While dsn = ''                           /* is it null?           */
   Say "Enter data set name:"               /* yes, so prompt them   */
   Parse Upper Pull dsn                     /* get the data set name */
End /* While */
msg = SYSDSN(dsn)                           /* is data set okay?     */
If msg = 'OK' Then                          /* yup.                  */
   Do
      "ALLOC FI(INDD) DA("dsn") SHR REUSE"  /* assign ddname to dsn  */
      If rc \= 0 Then Call Error "ALLOC" rc /* error with alloc cmd  */
      "EXECIO * DISKR INDD (STEM REC. FINIS"/* read data set to rec. */
      If rc \= 0 Then Call Error "EXECIO" rc/* error with execio cmd */
      "FREE FI(INDD)"                       /* release ddname        */
      Do i = 1 To rec.0                     /* step through vars and */
         rec.i = Strip(rec.i,'T')           /* remove trailing blanks*/
         Say rec.i                          /* and display each one  */
      End i
   End /* Then Do */
Else
   Call Error "SYSDSN" msg                  /* error with sysdsn()   */
Exit 0                                      /* bye, rc=0             */
Error:                                      /* my error routine      */
Parse Arg xfcn xmsg                         /* get passed args       */
Say "Error processing data set:" dsn        /* general error msg     */
If xfcn = 'ALLOC' Then                      /* problem with allocate */
   Say "Return Code from ALLOC is:" xmsg    /* say ALLOC message     */
If xfcn = 'EXECIO' Then                     /* problem with execio   */
   Say "Return Code from EXECIO is:" xmsg   /* say EXECIO message    */
If xfcn = 'SYSDSN' Then                     /* problem with data set */
   Say "Error from SYSDSN is:" xmsg         /* say SYSDSN message    */
Exit 99                                     /* bye, rc=99            */