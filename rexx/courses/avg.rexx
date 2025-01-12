parse upper arg numbers
numbers = translate(numbers,' ',',')
numbers = space(numbers)
call SumAvg numbers
avg = result / Words(numbers)
numberspart = subword(numbers,1,Words(numbers)-1)
numberspart = space(numberspart,1,',')
numbers = numberspart 'and' subword(numbers,Words(numbers))
say "The average of" numbers "is" avg
exit 0