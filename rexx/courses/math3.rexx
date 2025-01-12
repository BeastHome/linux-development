/*REXX*/
parse arg value1 value2 null
do while value1 \= "exit"
  if  value1='' | value2='' then
    do while value1='' | value2='' 
      say "Please enter two numbers:"
      parse pull value1 value2 null
      if value1="exit" then exit
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
    value1='';value2=''
  end
end
