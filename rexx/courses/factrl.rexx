/* Rexx exec factrl will calculate factorials and display them
   over the specified range.
   This is an exercise in Rexx programming, not mathematics.  The
   factorials are done in the obvious way. */
Signal On Novalue
/* Trace N >> rc=4 from compiler "Unsupported TRACE options" */
Parse Upper Arg first last width digits
If first = '' Then first = 1
If last = '' Then last = 10
If width = '' Then width = 79
If digits = '' Then digits = 10000
If ¬Datatype(first,'N') Then Call parm_error 'first'
If ¬Datatype(last,'N') Then Call parm_error 'last'
If ¬Datatype(width,'N') Then Call parm_error 'width'
If ¬Datatype(digits,'N') Then Call parm_error 'digits'
If first < 0 Then first = last + first
Say "Program FACTRL will calculate calculate factorials, starting",
    "at" first
Say "                      continuing to" last
Say "               for a print width of" width
Say "      numeric digits will be set to" digits
Parse Version parseversion /* Use Parse Version to see if compiled  */
If Left(parseversion,5)='REXXC' Then
    Say "This exec compiled"
Else
    Say "This exec interpreted"
Say "Parse Version gives:" parseversion
Parse Source parsesource
Say "Parse Source gives:" parsesource
Numeric Digits digits
Parse Numeric parsenumeric
Say "Parse Numeric gives:" parsenumeric
width_plus_1 = width + 1
factorial = 1
syscpu_start = SYSVAR('SYSCPU')
syssrv_start = SYSVAR('SYSSRV')
Do i = 1 To last
   factorial = factorial + i   /* not factorial !! */
   If i >= first Then
      Do /* print it out */
         Say "Factorial" i "is" Length(factorial) "digits long"