/*REXX*/
do forever
  say "Do you wish to add, subtract, multiply, or divide?"
  parse pull operator null
  if operator = 'exit' then
    leave
  if operator \= 'add' & operator \= 'subtract' & operator \= 'multiply' & ,
    operator \= 'divide' then
    do
      say operator "is not an appropriate answer."
      iterate
  end
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
end
