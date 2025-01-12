parse source . how .
parse arg numbers
total = 0
outputnumber = ''
do i = 1 To words(numbers)
   number = subword(numbers,i,1)
   If datatype(number,'N') then
      do
         total = total + number
         outputnumber = outputnumber||number' '
      end
   else
      say number "is not a number, and will be ignored."                
end i                                                                   
If how = 'COMMAND' then
   say "The sum of" outputnumber "is" total"."
else
   return total
exit 0                                                                  