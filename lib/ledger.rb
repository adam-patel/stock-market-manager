class StockTracker

attr_accessor :trades, :current_holdings

  def initialize
    @trades = []
    @current_holdings = []
  end

  def buy(market, quantity, book_cost)
    trade = Trade.new(market, quantity, book_cost)
    @trades << trade
    @current_holdings << trade
  end

  def sell(market, quantity, proceeds)
  end

  def check_current_holdings_of(market)
     @current_holdings[0].has_value?(market)
  end

  def update_average_buy_price
  end

  def create_trade_record(market, quantity, book_cost)
    trade = {"market" => market, "quantity" => quantity,
      "book_cost" => book_cost, "date" => Time.now}
    @trades << trade
    @current_holdings << trade
  end

end