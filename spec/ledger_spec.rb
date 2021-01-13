require 'ledger'

# 100 shares bought for 10000
# 50 shares sold for 6000
# 200 shares bought for 11000

describe StockTracker do

  it 'can add a trade to the trades array' do
    account = StockTracker.new
    trade = {"market" => "ULVR"}
    account.trades << trade
    expect(account.trades.length).to eq(1)
  end

  it 'has a #buy method' do
    expect(StockTracker.new).to respond_to(:buy)
  end

  it 'does not have a #test method' do
    expect(StockTracker.new).not_to respond_to(:test)
  end

  it 'has a #sell method' do
    expect(StockTracker.new).to respond_to(:sell)
  end

  it 'has a #check_current_holdings method' do
    expect(StockTracker.new).to respond_to(:check_current_holdings_of)
  end

  it 'can find a particular value in the current_holdings array of hashes' do
    account = StockTracker.new
    account.create_trade_record("ULVR", 300, 4040.40)
    expect(account.current_holdings[0]["market"]).to eq("ULVR")
    expect(account.current_holdings[0]["quantity"]).to eq(300)
  end

  it 'can check whether a current stock is already held' do
    account = StockTracker.new
    trade = account.create_trade_record("ULVR", 300, 3030.30)
    expect(account.check_current_holdings_of("ULVR")).to eq(true)
  end

  it 'has a #create_trade_record' do
    expect(StockTracker.new).to respond_to(:create_trade_record)
  end

  it '#create_trade_record creates a hash' do
    account = StockTracker.new
    account.create_trade_record("ULVR", 300, 4040.40)
    expect(account.current_holdings[0]["market"]).to eq("ULVR")
  end


end
