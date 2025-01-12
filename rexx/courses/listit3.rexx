/* REXX lab 10.2 */
parse upper arg dsn
do while dsn = ''                            /* is it null? */
   say "Enter data set name:"                /* Yes - Prompt for */
   parse upper pull dsn                      /* new data set name */
end
msg = SYSDSN(dsn)                            /* is data set okay? */
if msg = 'OK' then                           /* Yes - so go ahead */
   do
      indd = Stream(dsn,'C','OPEN')          /* open input stream */
      do i = 1 while lines(indd)             /* iterate dsn recs */
         rec.i = linein(indd)                /* read each line */
      end i
      rec.0 = i - 1                          /* number of lines read */
      do j = 1 to rec.0                      /* iterate vars */
         x = lineout(,strip(rec.j,'T'))      /* write output to term */
         if x \= 0 then call error 'Lineout' x/* call error on prob */
      end j
   end
else
   call error "SYSDSN" msg                   /* problem with SYSDSN */
exit 0
error:                                       /* error handling */
parse arg xfcn xmsg                          /* get passed arguments */
say "error processing data set:" dsn         /* general error message*/
if xfcn = 'SYSDSN' then                      /* SYSDSN error? */
   say "error from SYSDSN is:" xmsg          /* SYSDSN message */
if xfcn = 'Lineout' then                     /* Lineout() error? */
   say "error from Lineout function."        /* Lineout message */
exit 99