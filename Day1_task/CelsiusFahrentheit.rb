
while true
    print "1.convert celsius to fahrenheit
           2.convert fahrenheit to celsius
           3.exit"
    option=Integer(gets.chomp)
    if option==1
    	 print "enter the celsius"
    	 c=Integer(gets.chomp)
         print "The temperature is #{9/5*c+32}"
    elsif option==2;
    	print "enter the fahrenheit"
    	f=Integer(gets.chomp)
    	print "The temperature is #{5/9*(f-32)}"
    end

end

