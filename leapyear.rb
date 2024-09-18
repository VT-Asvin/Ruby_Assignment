year=Integer(gets.chomp)
def isleapyear(year)
   year%4==0 &&year%100!=0|| year%400==0;
end 
print isleapyear(year)

