def stock_picker(prices) 
  result={}
  min_index=0
  max_profit=0;
  prices.each.with_index do |price,index|
    if price<prices[min_index]
      min_index=index
    elsif price-prices[min_index]>max_profit
      max_profit=price - prices[min_index]
      result={min_index:min_index,max_index:index}
    end
    
  end
  result
end
puts stock_picker([17,3,6,9,15,8,6,1,10])
