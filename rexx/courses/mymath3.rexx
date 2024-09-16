do forever
  say "Do you wish to add, subtract, multiply, divide, or exit?"
  parse upper pull type
  if abbrev('EXIT',type) then
    Leave
  if abbrev('ADD',type) = 0 & ,
     abbrev('SUBTRACT',type) = 0 & ,
     abbrev('MULTIPLY',type) = 0 & ,
     abbrev('DIVIDE',type) = 0 then
    do
      say "'"type"' is not an appropriate answer."
      iterate
    end
  do forever
    say "Please enter two numbers:"
    parse upper pull num1 num2
    if datatype(num1,'N') & datatype(num2,'N') then
      Leave
    else
      say "You did not enter two numbers."
  end
  select
    When abbrev('ADD',type) then
      say num1 "+" num2 "=" num1 + num2
    When abbrev('SUBTRACT',type) then
      say num1 "-" num2 "=" num1 - num2
    When abbrev('MULTIPLY',type) then
      say num1 "*" num2 "=" num1 * num2
    When abbrev('DIVIDE',type) then
      do
        if num2 = 0 then
          say "Cannot divide by zero."
        else
          say num1 "/" num2 "=" num1 / num2
        end
    otherwise
      say "Invalid arithmetic type entered:" type
      say "You must enter ADD, SUBTRACT, MULTIPLY, DIVIDE, or EXIT."
  end
num2 = ''
end
say "Goodbye."
exit 0