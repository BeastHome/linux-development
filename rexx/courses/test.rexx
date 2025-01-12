/* i1 = 0
i2 = 0
do i1 = 1 to 10000 by 1
   do i2 = 1 to 1000 by 1
    say i1 i2
   end
end */

/*"ls -l | rxqueue"
DO i=1 WHILE queued() \= 0
  PARSE PULL line
  SAY  || ") " || line
END */

input = 'This is the data.'

Parse Var input 6 var1 var2 ' d'

say var1 var2