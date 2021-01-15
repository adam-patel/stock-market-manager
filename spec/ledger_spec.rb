require 'ledger'

# 100 shares bought for 10000
# 50 shares sold for 6000
# 200 shares bought for 11000

describe StockTracker do

  it 'can add a trade to the trades array' do
    account = StockTracker.new
    trade = {"market" => "ULVR"}
    account.transactions << trade
    expect(account.transactions.length).to eq(1)
  end

  it 'has a #buy method' do
    expect(StockTracker.new).to respond_to(:buy)
  end

  # it '#buy method creates a transaction' do
  #   account = StockTracker.new
  #   account.buy("ULVR", 300, 1000)
  #   expect(account.transactions[0]).to eq({:market => "ULVR", :quantity => 300, :book_cost => 1000, :date => })
  # end

  it 'can deposit cash in the account' do
    account = StockTracker.new
    account.deposit_funds(100)
    account.deposit_funds(100)
    expect(account.balance).to eq(200)
  end

  it 'can withdraw cash from the account' do
    account = StockTracker.new
    account.deposit_funds(100)
    expect(account.balance).to eq(100)
    account.withdraw_funds(50)
    expect(account.balance).to eq(50)
  end

  it 'balance cannot be negative' do
    account = StockTracker.new
    account.deposit_funds(100)
    expect(account.balance).to eq(100)
    account.withdraw_funds(200)
    expect(account.balance).to eq(100)
  end

  it 'can record receipt of a dividend payment' do
    account = StockTracker.new
    account.deposit_funds(100)
    expect(account.dividends.length).to eq(0)
    account.dividend("ULVR", 33.41)
    expect(account.dividends.length).to eq(1)
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
    expect(account.transactions[0][:market]).to eq("ULVR")
    expect(account.transactions[0][:quantity]).to eq(300)
  end

  it 'can check whether a current stock is already held' do
    account = StockTracker.new
    trade = account.create_trade_record("ULVR", 300, 3030.30)
    expect(account.check_current_holdings_of("ULVR")).to eq(true)
  end

  it 'if a stock is held, will tell you the quantity held' do
    account = StockTracker.new
    account.create_trade_record("ULVR", 300, 3030.30)
    account.create_trade_record("ULVR", 400, 3030.30)
    account.create_trade_record("BATS", 500, 3030.30)
    account.create_trade_record("AMZN", 43, 32094.40)
    expect(account.what_is_current_holding_of("ULVR")).to eq("You currently hold 700 shares in ULVR, at a cost of 6060.6")
  end

  it 'if a stock is held, will tell you the quantity held and the total cost' do
    account = StockTracker.new
    account.create_trade_record("ULVR", 300, 3030.30)
    account.create_trade_record("ULVR", 400, 3030.30)
    account.create_trade_record("BATS", 500, 3030.30)
    account.create_trade_record("AMZN", 43, 32094.40)
    expect(account.what_is_current_holding_of("BATS")).to eq("You currently hold 500 shares in BATS, at a cost of 3030.3")
  end

  it 'has a #create_trade_record' do
    expect(StockTracker.new).to respond_to(:create_trade_record)
  end

  it '#create_trade_record creates a hash' do
    account = StockTracker.new
    account.create_trade_record("ULVR", 300, 4040.40)
    expect(account.transactions[0][:market]).to eq("ULVR")
  end

  it '#sell method checks to see if you hold a stock before it lets you sell it' do
    account = StockTracker.new
    account.create_trade_record("ULVR", 300, 3030.30)
    account.create_trade_record("ULVR", 400, 3030.30)
    account.create_trade_record("BATS", 500, 3030.30)
    account.create_trade_record("AMZN", 43, 32094.40)
    expect(account.sell("GOOG", 100, 2030.00)).to eq("You cannot sell what you do not have")
  end

  it 'returns updated current quantity when a sale takes place' do
    account = StockTracker.new
    account.create_trade_record("ULVR", 300, 3030.30)
    account.create_trade_record("ULVR", 400, 3030.30)
    account.create_trade_record("BATS", 500, 3030.30)
    account.create_trade_record("AMZN", 43, 32094.40)
    expect(account.sell("ULVR", 100, 3921)).to eq(600)
  end

  # it 'updates :average_book_roast of holding if stock already held' do
  #   account = StockTracker.new
  #   account.create_trade_record("ULVR", 500, 1000.00)
  #   expect(account.current_holdings["ULVR"][:average_cost_per_share]).to eq(2)
  #   account.create_trade_record("ULVR", 500, 2000.00)
  #   expect(account.current_holdings["ULVR"][:average_buy_price]).to eq(3)
  # end

  it 'tracks balance through several transactions' do
    account = StockTracker.new
    account.deposit_funds(10000)
    account.create_trade_record("ULVR", 300, 5000.00)
    expect(account.balance).to eq(5000)
    account.sell("ULVR", 300, 6000.00)
    expect(account.balance).to eq(11000)
  end

  it 'will not let you buy if you do not have enough funds' do
    account = StockTracker.new
    account.buy("ULVR", 300, 3000.00)
    expect(account.buy("ULVR", 300, 3000.00)).to eq("Insufficient funds.")
  end

  it '#update_current_holdings inceases the @current_holdings hash by 1' do
    account = StockTracker.new
    account.update_current_holdings("ULVR", 100, 1000)
    expect(account.current_holdings.length).to eq(1)
  end

  it '#update_current_holdings updates the book cost' do
    account = StockTracker.new
    account.update_current_holdings("ULVR", 100, 1000)
    account.update_current_holdings("BATS", 50, 5000)
    account.update_current_holdings("ULVR", 200, 1000)
    expect(account.current_holdings["ULVR"][:quantity]).to eq(200)
  end

  # it 'current_holdings hash structure when taking multiple records' do
  #   account = StockTracker.new
  #   account.current_holdings = {"ULVR" => {:market = "ULVR", :quantity => 100, :book_cost => 1000, :average_buy_price => 1000}}
  #   account.current_holdings = {"BATS" => {:market = "BATS", :quantity => 100, :book_cost => 1000, :average_buy_price => 1000}}
  #   expect(account.current_holdings).to eq({"ULVR" => {:market = "ULVR", :quantity => 100, :book_cost => 1000, :average_buy_price => 1000}, "BATS" => {:market = "BATS", :quantity => 100, :book_cost => 1000, :average_buy_price => 1000}})
  # end


end
