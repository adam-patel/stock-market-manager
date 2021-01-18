require 'sinatra/base'

class App < Sinatra::Base

  enable :sessions

  get '/' do
    # will be located at https://my.assetdashboard.co.uk
    @app_name = "Asset Dashboard"
    erb(:index)
  end

  get '/register' do
    # where users register for an account
    # erb(:register)
  end

  post '/registration' do
    # creates User.new for the new user
    # redirects to /account
    # erb(:registration)
  end

  get '/login' do
    # where the user signs in to their account
    # erb(:login)
  end

  get '/account' do
    # will be the location of the actual dashboard
    # user can create a stock account or a property
    # erb(:account)
  end

  get 'add_stock_account' do
    # add a stock account
  end

  get 'add_property' do
    # add a property
  end

end
