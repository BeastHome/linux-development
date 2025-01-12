parse arg num1 num2
do i = 1 while translate(num1) \= 'EXIT'
  do while datatype(num1,'N') \= 1 | datatype(num2,'N') \= 1
    say "Please enter two numbers, or type 'exit' to quit:"
    parse pull num1 num2
    if translate(num1) = 'EXIT' then Leave i
  end
  say "At" time() "on" date() "you entered" num1 "and" num2
  say num1 "+" num2 "=" num1 + num2
  say num1 "-" num2 "=" num1 - num2
  say num1 "*" num2 "=" num1 * num2
  if num2 = 0 then
    say "Cannot divide by zero."
  else
    do
      say num1 "/" num2 "=" num1 / num2
      say num1 "divided by" num2 "is" num1 % num2 "with a remainder",
          "of" num1 // num2
    end
    num2 = ''
end 
say "Goodbye."
exit 0