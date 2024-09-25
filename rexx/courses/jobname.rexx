/* Rexx exec to display address space name (jobname) -- lab 19 */
cvtaddr = Storage('10',4)
Say "The CVT address is" c2x(cvtaddr)
newoldptr = Storage(c2x(cvtaddr),4)
Say "The NEW/OLD pointer address is" c2x(newoldptr)
newoldoffset = d2x(c2d(newoldptr) + x2d('C'))
ascbaddr = Storage(newoldoffset,4)
Say "The ASCB address is" c2x(ascbaddr)
ascboffset = d2x(c2d(ascbaddr) + x2d('B0'))
jnameaddr = Storage(ascboffset,4)
Say "The JOBNAME address is" c2x(jnameaddr)
jobname = Storage(c2x(jnameaddr),8)
Say "The job name is" jobname
Exit 0