/* REXX lab 10.2 */
parse upper arg dsn
do while dsn = ''                            /* is dsn null? */
   say "Enter data set name:"                /* yes - Prompt for */
   parse upper pull dsn                      /* new data set name */
end
msg = SYSDSN(dsn)                            /* is data set okay? */
if msg = 'OK' then                           /* yes - so go ahead */
   do
      "ALLOC FI(INDD) DA("dsn") SHR REUSE"   /* assign dd to dsn */
      if rc \= 0 then call error "ALLOC" rc  /* if bad rc call error */
      "ALLOC FI(OUTDD) DA(*) SHR REUSE"      /* assign dd to screen */
      if rc \= 0 then call error "ALLOC" rc  /* bad rc - call error */
      "EXECIO * DISKR INDD (FINIS"           /* read dsn to stack */
      if rc \= 0 then call error "EXECIO" rc /* bad rc - call error */
      "FREE FI(INDD)"                        /* release input ddname */
      "EXECIO" Queued() "DISKW OUTDD"        /* write stack to screen*/
      if rc \= 0 then call error "EXECIO" rc /* bad rc - call error */
   end
else
   call error "SYSDSN" msg                   /* problem with SYSDSN */
exit 0
error:                                       /* error handling */
parse arg xfcn xmsg                          /* get passed arguments */
say "error processing data set:" dsn         /* general error message*/
if xfcn = 'ALLOC' then                       /* ALLOC error */
   say "Return Code from ALLOC  is:" xmsg    /* ALLOC message */
if xfcn = 'EXECIO' then                      /* EXECIO error */
   say "Return Code from EXECIO is:" xmsg    /* EXECIO message */
if xfcn = 'SYSDSN' then                      /* SYSDSN error */
   say "error from SYSDSN is:" xmsg          /* SYSDSN message */
exit 99