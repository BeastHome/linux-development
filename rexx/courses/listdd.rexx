/* Rexx listdd exec (lab 13) */
Parse Upper Arg ddreq                  /* get input arg (dd or $)    */
If ddreq = '$' Then                    /* is it a $?                 */
   Do
      Say 'Enter the ddname'           /* yes, ask for ddname        */
      Parse Upper Pull ddreq           /* get ddname                 */
   End /* Then */
x = OUTTRAP('LINE.')                   /* turn on output trapping    */
'LISTALC STATUS'                       /* issue tso command listalc  */
x = OUTTRAP('OFF')                     /* turn off output trapping   */
Say 'DDNAME    DATASET'                /* display output headers     */
Say '*****************'                /* loop through output from   */
Do n = 2 To line.0                     /*    second line to end      */
   Parse Var line.n dataset ddname     /* extract dataset and ddname */
   If ddname = '' Then                 /* is ddname null?            */
      Do
         n = n + 1                     /* yes, skip to next line,    */
         ddname = Substr(line.n,3,8)   /* and pull out cols 3 to 10  */
      End /* Then */
   If ddname <> '' Then                 /* if ddname is not null,    */
      currdd = ddname                   /*   then save it            */
   If ddreq = currdd | ddreq = '' Then  /* is it the one we want?    */
      Do                                /*   Yes, it is              */
         ddname = Strip(ddname)         /* remove unwanted blanks    */
         Say Left(ddname,9) dataset     /* display ddn and dsn       */
      End /* Then Do */
End n
Exit 0