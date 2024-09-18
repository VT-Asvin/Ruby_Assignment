
def leap_year?(year)
   year % 4 == 0 && year % 100 != 0|| year % 400 == 0;
end 

p "Enter Year:"
year = Integer(gets.chomp)
print leap_year?(year)

