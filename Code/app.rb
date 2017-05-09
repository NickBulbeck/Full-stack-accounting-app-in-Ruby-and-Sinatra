require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'date' )
require_relative('controllers/categories_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/months_controller')

get '/' do
  @current_month = Date.today.month
  @current_year = Date.today.year
  @current_day = Date.today.day
  erb( :index )
end
