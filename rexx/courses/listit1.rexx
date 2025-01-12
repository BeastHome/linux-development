/* REXX lab 10.1 */
parse upper arg dsn                         /* get data set name */
do while dsn = ''                           /* is it null? */
   say "Enter data set name:"               /* prompt them if yes */
   parse upper pull dsn                     /* get the data set name */
end
msg = SYSDSN(dsn)                           /* valid data set? */
if msg = 'OK' then                          /* yes */
   do
      "ALLOC FI(INDD) DA("dsn") SHR REUSE"  /* assign ddname to dsn */
      if rc \= 0 then call error "ALLOC" rc /* error with alloc */
      "EXECIO * DISKR INDD (STEM REC. FINIS"/* read data set to rec. */
      if rc \= 0 then call error "EXECIO" rc/* error with execio */
      "FREE FI(INDD)"                       /* release ddname */
      do i = 1 to rec.0                     /* iterate vars and */
         rec.i = Strip(rec.i,'T')           /* remove trailing space*/
         say rec.i                          /* and display each one */
      end i
   end
else
   call error "SYSDSN" msg                  /* error with sysdsn() */
exit 0
error:                                      /* error handling */
parse arg xfcn xmsg                         /* get passed args */
say "error processing data set:" dsn        /* general error msg */
if xfcn = 'ALLOC' then                      /* problem with allocate */
   say "Return Code from ALLOC is:" xmsg    /* ALLOC message */
if xfcn = 'EXECIO' then                     /* problem with execio */
   say "Return Code from EXECIO is:" xmsg   /* EXECIO message */
if xfcn = 'SYSDSN' then                     /* problem with data set */
   say "error from SYSDSN is:" xmsg         /* SYSDSN message    */
exit 99