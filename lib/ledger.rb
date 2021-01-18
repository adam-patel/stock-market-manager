class StockTracker

attr_accessor :transactions, :current_holdings, :balance, :dividends

  def initialize
    @transactions = []                 # lists every transaction
    @current_holdings = {}             # holds a summary of equities held (including average buy prices)
    @balance = 0
    @ledger = []
    @dividends = []
  end

  def deposit_funds(amount)
    deposit_amount = amount
    @balance = @balance + deposit_amount
    @transactions << {:deposit => amount, :date => Time.now}
  end

  def withdraw_funds(amount)
    if @balance > amount
        @balance = @balance - amount
        @transactions << {:withdrawal => amount, :date => Time.now}
      else
        return "Not possible. Withdrawal cannot exceed balance."
    end
  end

  def update_balance

  end

  def buy(market, quantity, book_cost)
    if @balance < book_cost
        return "Insufficient funds."
      else
        create_trade_record(market, quantity, book_cost)
    end
  end

  def sell(market, quantity, proceeds)
    if current_holding_of(market) == true
      all = @transactions.select { |holding| holding[:market] === market }
      total_quantity = all.map { |h| h[:quantity]}.reduce(0, :+)
      total_cost = all.map { |c| c[:book_cost]}.reduce(0, :+)
      current_quantity = total_quantity - quantity
      @balance = @balance + proceeds
      # book_the_trade(market, quantity, proceeds)
      return current_quantity
    else
      return "You cannot sell what you do not have"
    end
  end

  def dividend(market, amount)
    @dividends << {:market => market, :amount => amount }
  end

  def check_current_holdings_of(market)
    holding = @transactions.select { |holding| holding[:market] === market }
    if holding.length > 0
      return true
    else
      return false
    end
  end

  def what_is_current_holding_of(market)
    if current_holding_of(market) == true
    all = @transactions.select { |holding| holding[:market] === market }
      # puts all.length
      # puts all[0][:quantity]
      # puts all[0][:date]
      total_quantity = all.map { |h| h[:quantity]}.reduce(0, :+)
      total_cost = all.map { |c| c[:book_cost]}.reduce(0, :+)
      average_cost_per_share = total_cost / total_quantity
      puts "Average cost per share: £" + average_cost_per_share.to_s
      return "You currently hold #{total_quantity} shares in #{market}, at a cost of #{total_cost}"
    else
      return "You don't currently hold #{market} in your portfolio."
    end
  end

  def current_holding_of(market)
    check_current_holdings_of(market)
  end

  def tesst
    @current_holdings.each_with_index do | market, book_cost |
      puts "#{market} is number #{index} in the array"
    end
  end

  # def update_average_buy_price(market)
  #   if current_holding_of(market) == true
  #
  #   end
  # end

  # def update_quantity_held
  #   # updates quantity after a buy transaction on a stock
  #   # that we already hold
  # end

  def create_trade_record(market, quantity, book_cost)
    trade = {:market => market, :direction => "BUY", :quantity => quantity,
      :book_cost => book_cost, :date => Time.now}
    @transactions << trade
      # if the equity is already held,
    # if current_holding_of(market) == true
    #   # update shit, which means add current purchases to existing purchases
    #   # -- find the relevant hash in current_holdings for the equity in question
    #   @current_holdings[market]
    #   #  -- add the book_cost of current trade to average_buy_price in current_holdings
    #   @current_holdings[market][:book_cost] = trade[:book_cost] + @current_holdings[market][:book_cost]
    #   #  -- add the quantity of current trade to quantity in current_holdings
    #   @current_holdings[market][:quantity] = trade[:quantity] + @current_holdings[market][:quantity]
    # else # if the equity is NOT already held,
    #   # add a new record
    #   @current_holdings = {market => {:market => market, :quantity => quantity,
    #     :book_cost => book_cost, :average_buy_price => book_cost }}
    # end
    #update the balance
    @balance = @balance - book_cost
  end

  def update_current_holdings(market, quantity, book_cost)
    if current_holding_of(market) == true

      else
        # {:market => "ULVR", :direction => "BUY", :quantity => 300, :average_buy_price => 100}
    end

    # {:market => "ULVR", :direction => "BUY", :quantity => 300, :book_cost => 3000, :average_buy_price => 100}

    # if the equity is NOT already held, simply add it to check_current_holdings

    # if the equity is already held:

    # if the transaction was a BUY,

    # calculate and update new average buy price
    # calculate and update the held quantity

    # if the transaction was a SELL

    # calculate and update the held quantity
    # calculate and update the new book cost

    all = @transactions.select { |holding| holding[:market] === market }
    buys = all.map { |b| b[:direction] === "BUY"}
    total_quantity = buys.map { |h| h[:quantity]}.reduce(0, :+)
    total_cost = buys.map { |c| c[:book_cost]}.reduce(0, :+)
    new_total_quantity = total_quantity + quantity
    new_total_cost = total_cost + book_cost
    # average_buy_price = new_total_quantity / new_total_cost
    @current_holdings[market] = {:market => market, :quantity => new_total_quantity, :book_cost => new_total_cost}
  end

  # def book_the_trade(market, quantity, proceeds)
  #   average_buy_price = @current_holdings[market]
  #   porl = proceeds - average_buy_price
  #   trade = {:sell_date => Time.now, :quantity => quantity, :proceeds => proceeds, :porl => porl}
  #   @ledger << trade
  # end

end

class Property

  # for property investments

  def initialize
    @property_name # give you property a name
    @property_address # first line of address
    @property_postcode # postcode
    @ledger
    @rentpcm = 1400
    @managementfee = 0.09
    @rent_date
    @tenancy_start_date
    @tenancy_end_date
  end

  # what date in the month should you expect rent to arrive? e.g.12th
  # tenancy start and end dates

  def property_setup
    # runs when a new property is created within User account
    # asks questions about the property and stores answers on the property object
  end

  def rent_checker
    # checks with ledger to see if rent figure has been recorded on rentdate
    # if rent not enered, asks user if rent has been received
  end

  def rent_paid
    # records a rental payment to the ledger
  end

  def expense
    # records an expense incurred
  end

end
