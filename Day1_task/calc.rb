print "Enter your choice
       1.Add 
       2.Subtract 
       3.Multiply
       4.division
       5.exponent"

choice =gets.chomp.to_i
print "enter two numbers"
num1=gets.chomp.to_i
num2=gets.chomp.to_i

def add(num1,num2)
  num1+num2
end
def sub(num1,num2)
   num1-num2
end
def mul(num1,num2)
   num1*num2
end
def div(num1,num2)
   num1/num2
end
def expo(num1,num2)
   num1**num2
end
def modulo(num1,num2)
   num1%num2
end
case choice
 
 when 1
     puts "addition of two numbers is #{add(num1,num2)}"
 when 2
  puts "subtraction of two numbers is #{sub(num1-num2)}"
 when 3
  puts "Multiplication of two numbers is #{mul(num1*num2)}"
 when 4
  puts "exponent of two numbers is#{expo(num1**num2)}"
 else
   puts "modulo of two numbers is #{modulo(num1,num2)}"
end