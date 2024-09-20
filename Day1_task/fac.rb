print "enter a number to the factorial"
num1=gets.chomp.to_i
count=1;
while num1>0

	 count*=num1
	 num1-=1
end
print count
