class Integer

  def to_s
     puts "overrided Intger"
  end
end
class Array
  
  def reverse
     puts "printing#{to_s}"

  end


end
class String
   
   def reverse
      puts "Asvin"
      
   end

end
puts 1.to_s
puts [1,2,3].reverse
s=String.new
s.reverse
"Asvin".reverse