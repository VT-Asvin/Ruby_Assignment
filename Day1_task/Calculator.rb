class Calculator
  attr_accessor :num1,:num2
  def initialize(num1,num2)
    @num1 = num1
    @num2 = num2
  end
  def add
    @num1 + @num2
  end
  
  def subtract
    @num1 - @num2
  end
  
  def multiply
    @num1 * @num2
  end
  
  def divide
    return "Error: Division by zero" if @num2.zero?
    @num1 / @num2
  end
  
  def exponentiate
    @num1 ** @num2
  end
  
  def modulo
    @num1 % @num2
  end
  def disp
    num1=34
  end
end

p "Enter num1"
num1 = gets.chomp.to_i

p "Enter num2"
num2 = gets.chomp.to_i
calc = Calculator.new(num1, num2)
puts "addition : #{ calc.add }"
puts "subtraction : #{ calc.subtract }"
puts "multiplication : #{ calc.multiply }"
puts "division : #{ calc.divide }"
puts "exponentiation : #{ calc.exponentiate }"
puts "modulo : #{ calc.modulo }"
