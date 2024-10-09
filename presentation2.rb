# class RBI
#   def initialize(interest_rate)
#     @interest_rate = interest_rate
#   end

#   def regulations
#     puts "RBI regulations apply to all banks."
#     puts "Interest Rate set by RBI: #{@interest_rate}%"
#   end
# end

# class Bank < RBI
#   def initialize(interest_rate, bank_name)
#     super(interest_rate)  
#     @bank_name = bank_name
#   end

#   def regulations
#     super   
     
#     puts "This bank's name is #{@bank_name}."
#   end
# end
# bank = Bank.new(5.0, "ABC Bank")
# bank.regulations


#passing arguments

# class Parent
#   def initialize(a=nil, b=nil, c=nil)
#     puts "Parent initialized with: a=#{a}, b=#{b}, c=#{c}"
#   end
# end

# class Child < Parent

#   def initialize(a, b, c, d, e, f)
#     super(a, b, c) 
#     puts "Child initialized with: d=#{d}, e=#{e}, f=#{f}"
#   end

#   def initialize(a, b, c)
#     super
#   end

 
#   def initialize(a, b, c)
#     super()  
#   end
# end


# child = Child.new(1, 2, 3, 4, 5, 6)
#  child2 = Child.new(1, 2, 3) 



#Accessor methods

class Treasure
  def initialize(name)
    @name = name
  end

  
  def name
    @name
  end

 
  def name=(new_name)
    @name = new_name
  end
end


treasure = Treasure.new("Gold Coin")

puts treasure.name         
treasure.name = "Silver Coin"
puts treasure.name         


     




