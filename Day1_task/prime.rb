def isprime(num)
    c=2
    if num<2
      return false
    end
    while c*c<=num
        if num%c==0
         return false
        end
      c+=1
    end
  return true
end

 print isprime(gets.chomp.to_i)