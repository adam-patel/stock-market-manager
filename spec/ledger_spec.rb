require 'ledger'

# 100 shares bought for 10000
# 50 shares sold for 6000
# 200 shares bought for 11000

describe StockTracker do

  it 'can add a trade to the trades array' do
    account = StockTracker.new
    trade = Trade.new("ULVR", 300, 3948.39)
    account.trades << trade
    expect(account.trades.length).to eq(1)
  end

  it 'has a #buy method' do
    expect(StockTracker.new).to respond_to(:buy)
  end

  it 'does not have a #test method' do
    expect(StockTracker.new).not_to respond_to(:test)
  end

  it 'calling the #buy method creates a Trade.new' do
    account = StockTracker.new
    account.buy("ULVR", 300, 3948.39)
    expect(account.trades.length).to eq(1)
    expect(account.trades[0].quantity).to eq(300)
  end

  it 'has a #sell method' do
    expect(StockTracker.new).to respond_to(:sell)
  end

  it 'has a #check_current_holdings method' do
    expect(StockTracker.new).to respond_to(:check_current_holdings_of)
  end

  # it 'can tell whether a particular stock is already owned or not' do
  #     account = StockTracker.new
  #     account.buy("ULVR", 300, 4949.43)
  #     expect(account.check_current_holdings_of("ULVR")).to eq(true)
  #   expect()
  # end

  it 'has a #create_trade_record' do
    expect(StockTracker.new).to respond_to(:create_trade_record)
  end

  it '#create_trade_record creates a hash' do
    account = StockTracker.new
    account.create_trade_record("ULVR", 300, 4040.40)
    expect(account.current_holdings[0]["market"]).to eq("ULVR")
  end


end

describe Trade do

  it 'can record a trade' do
    trade = Trade.new("ULVR", 300, 4564.43)
    expect(trade.market).to eq("ULVR")
    expect(trade.quantity).to eq(300)
    expect(trade.book_cost).to eq(4564.43)
  end

end
