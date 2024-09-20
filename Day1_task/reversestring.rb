def reverse(str1)
   str2=""
   str1.each_char do |i|
       str2=i+str2
   end
   str2
end

print reverse("hello")
