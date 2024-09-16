parse upper arg numbers
total = 0
do i = 1 to words(numbers)
  number = subword(numbers,i,1)
  total = total + number
end i
say "The sum of" numbers "is" total"."
exit 0