/*REXX*/
signal on syntax

say "Do you wish to add(+), subtract(-), multiply(*), or divide(/)?"
  parse pull operator null
say "Please enter two numbers:"
  parse pull value1 value2 null
select
  when operator="add" | operator="+" then
     say value1 "+" value2 "=" value1+value2
  when operator="subtract" | operator="-" then
     say value1 "-" value2 "=" value1-value2
  when operator="multiply" | operator="*" then
     say value1 "*" value2 "=" value1*value2
  when operator="divide" | operator="/" then
       if value2 = 0 then
        say "The second number is 0: division cannot be done."
       else
         do
           say value1 "/" value2 "=" value1/value2
           say value1 "divided by" value2 "is" value1%value2,
             "with a remainder of" value1//value2
         end
  otherwise
    say "Invalid operator was selected"
end
exit 0

Syntax:
Say "An error was encountered trying to perform the"
Say "requested arithmetic with the following values:"
Say ""
Say value1 value2
Say ""
Say "It is likely that one or both of the values"
Say "entered are not decimal numbers."
Say "The error occurred on line number" sigl
Say "The line in the source code that caused the error is:"
Say ""
Say Sourceline(sigl)
Say ""
Say "This program will exit with the return code of 99."
Exit 99