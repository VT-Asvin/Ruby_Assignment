# optimized solution  time complexity o(n) and space complexity o(n)
def two_sum(number_array, target_number)

  storing_previous_possible_numbers=[]
  index=1
  number_array.each{
     |current_number|
     if ( storing_previous_possible_numbers.include?(target_number - current_number ))

         index1=number_array.index ( target_number - current_number )
         result = [ index1+1 ,index]
         return result

     else
        storing_previous_possible_numbers << current_number

     end

     index+=1

  }

 []
end

#Time Limit Exceeded soution

def two_sum(number_array, target)
  index1=0
  len=number_array.size
  for index1 in 0 .. len do
     for index2 in  (index1+1) ..  len-1 do
          if( (number_array [index1] + number_array[index2] ) == target )
              ans = [ index1+1 , index2+1 ]
              return ans
           end
      end
    []
    end
end

