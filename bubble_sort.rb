def bubble_sort(arr)
	
  n = arr.length
  loop do
    swap = false

    (n - 1).times do |j|

      if arr[j] > arr[j + 1]
        arr[j], arr[j + 1] = arr[j + 1], arr[j] 
        swap = true
      end

    end

    break if swap==false  
  end
  arr  

end



puts bubble_sort([17, 3, 6, 9, 15, 8])
