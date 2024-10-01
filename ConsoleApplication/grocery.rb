class Shop
  NOTES=[500,100,50,20,10,5,2,1].freeze
  PRODUCTS={
     "curd"=>20,
     "milk"=>30,
     "biscut"=>50
 }.freeze
  attr_accessor :product_price
 
  def initialize 
    puts  "Grace Departmental Store"
    @amounts=Hash.new(0)
    @savings=0
    @product_price=0
    @exchange_amts = Hash.new(0)
    deposit
    @revert_store_cash=Hash.new(0)
    @amounts.sort_by{ |amts,counts| amts }.reverse!
    puts "#{@amounts}"
  end

 def deposit
    puts "Enter the no of notes you have in 500,100,50,20,10,5,2,1 with comma separated values in correct order"
    cashes=gets.chomp.split(",")
    note_count=0;
    cashes.each{
      |count|
      @amounts[NOTES[note_count]]=count.to_i
      @savings+=NOTES[note_count]*count.to_i
      note_count+=1
    }
     display_amt
     puts "Total amount in cashier box: #{@savings}Rs"

 end

 def display_amt
   puts "Savings Cash Details"
   puts "#{"Rupees".ljust(10)}|Count"
   puts "_"*17
   @amounts.each{
    |amt,count|
    puts "#{amt.to_s.ljust(10)}|#{count.to_s.ljust(10)}"
   }
   puts"_"*17
 end

 def store_cash_from_customer(user_amt)
    user_amt.each{
      |amt|
      @amounts[amt.to_i]=@amounts[amt.to_i]+1
       @exchange_amts[amt.to_i]=@exchange_amts[amt.to_i]+1
      @savings+=amt.to_i
    }
  #  puts "after storing customers money"
    display_amt
    puts "Total amount in cashier box: #{@savings}Rs"

 end

 def need_of_changes(user_amt)
  
   return "The banker has insufficent amt for exchange" if @savings<user_amt

 #  puts "printing amounts#{@amounts}"
   @amounts.each do |amt,counts|
            break if(user_amt==0)
            next if counts.zero?
            possible_amt=user_amt/amt
            used_amt=[counts,possible_amt].min
            @amounts[amt]-=used_amt
            @revert_store_cash[amt]+=used_amt
            @savings-=used_amt*amt
            user_amt-=used_amt*amt
      end
    return "Please bring exact change#{revert_transaction}" if user_amt!=0
    puts "The stores savings is : #{@savings}"
 end

 def revert_transaction

   @exchange_amts.each{
    |amt,count|
    @amounts[amt]=@amounts[amt]-count
    @savings-= amt*count
   }
   @revert_store_cash.each{
    |amt,count|
    @amounts[amt]+=count
    @savings+=amt*count
   }
   puts "After Transaction Failed the savings of store is #{@savings} and revert_stor_cash is #{@revert_store_cash}"
 end


end


 s= Shop.new
 loop do
   puts "Enter your choice"
   puts "1.view products"
   puts "2.purchase products"
   puts "3.exit"
   choice=gets.chomp.to_i
   case choice
   when 1 
      puts" you have selected choice 1.view products"
      puts "PRODUCTS #{Shop::PRODUCTS}"
   when 2
     puts" you have selected choice 2.purchase products"
     puts "From the products Enter your items with comma(,) separated values #{Shop::PRODUCTS}"
     customer_wishlist=gets.chomp.split(",")
     proudtcs_costs=0
     customer_wishlist.each{
      |item|
       proudtcs_costs+=Shop::PRODUCTS[item]
     }
     puts "The cost of your total products is:#{proudtcs_costs}"
     puts "Enter the denominations given by the customer with comma separated values(,)"
     user_amt=gets.chomp.split(",")
     user_total=user_amt.sum{|amt| amt.to_i}

     if (user_total<proudtcs_costs)
          puts "The customer has insuffiecent amt"
     else
          
          s.store_cash_from_customer(user_amt)
        
          change=(proudtcs_costs-user_total).abs
          puts "The cashier needs to give change of #{change}.Rs to customer"
          if change!=0
              puts s.need_of_changes(change)
          else
              puts "The customer has purchased the product and Bill Generated"
            end
          end
        else
          puts "Customer exited"
          break
        end
end