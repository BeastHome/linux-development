/* REXX mytime Lab 9*/
signal On novalue
signal On error
call OUTTRAP 'rec.'  
Address TSO 'TIME'                        
call OUTTRAP 'OFF'                         
dashpos = pos('-',rec.1)                     /* find first dash (-)  */
curtime = substr(rec.1,dashpos + 1,12)       /* get current time     */
nxtdsh = pos('-',rec.1,dashpos + 1)          /* find next dash       */
cputime = substr(rec.1,nxtdsh + 1,8)         /* get cpu time         */
nxtdsh = pos('-',rec.1,nxtdsh + 1)           /* find next dash       */
blank = pos(' ',rec.1,nxtdsh)                /* find next blank      */
srvlen = blank - nxtdsh                     /* field length for SRVs */
srvunt = substr(rec.1,nxtdsh + 1,srvlen)     /*  get SRV units       */
nxtdsh = pos('-',rec.1,blank)                /* find next dash       */
sesstime = substr(rec.1,nxtdsh + 1,8)        /* get session time     */
Say "The current time is" curtime            /* display current time */
Say userid() "has been logged on for" sesstime /* display logon time */
Say "The session has used" cputime "CPU time"  /* display CPU time   */
Say "and" srvunt "service units."           /* display service units */
Exit 0

novalue:
Say "An uninitialized variable was encountered on line" sigl"."
Say "The variable name is" Condition('D')
Say "The source code statement is:"
Say Sourceline(sigl)
Exit 20

error:
Say "A non-zero return code was encountered. The return code is:" rc
Say "The source code statement at line" sigl "is:"
Say Sourceline(sigl)
Exit rc