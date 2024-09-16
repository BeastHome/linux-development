/*REXX*/
signal on syntax
parse arg value1 value2 null
if  value1='' | value2='' then
  do
    say "Please enter two numbers:"
    parse pull value1 value2 null
  end
do
  say "You entered" value1 "and" value2"."
  say value1 "+" value2 "=" value1+value2
  say value1 "-" value2 "=" value1-value2
  say value1 "*" value2 "=" value1*value2
  if value2 = 0 then
      say "The second number is 0: division cannot be done."
  else
  do
      say value1 "/" value2 "=" value1/value2
      say value1 "divided by" value2 "is" value1%value2, 
      "with a remainder of" value1//value2
  end
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