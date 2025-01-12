/*REXX*/

say "Please enter two numbers:"
parse pull value1 value2
say "You entered" value1 "and" value2"."
  if value2 = 0 then
    say "Division by 0 is not allowed."
  else
do
say value1 "+" value2 "=" value1+value2
say value1 "-" value2 "=" value1-value2
say value1 "*" value2 "=" value1*value2
say value1 "/" value2 "=" value1/value2
say value1 "divided by" value2 "is" value1%value2 "with a remainder" ,
  "of" value1//value2
end
