/* REXX Listit4 lab 10.2) */
say "Enter lines of data to be written to"
say "your ES52.EXEC data set, member STRMIO."
user = sysvar(sysuid)
do i = 1                                     /* start looping */
   rec.i = Linein()                          /* get next line */
   if rec.i = '' then                        /* if null, get out */
      leave i
end i
do j = 1 to i - 1                            /* write output */
   x = lineout(user'.ES52.EXEC(STRMIO)',rec.j)
   if x \= 0 then call error 'lineout' x     /* call error handling */
end j
x = lineout(user'.ES52.EXEC(STRMIO)')
exit 0
error:                                       /* error handling */
parse arg xfcn xmsg                          /* get passed arguments */
if xfcn = 'lineout' then                     /* lineout() error     */
   say "error from lineout function."        /* lineout message  */
exit 99