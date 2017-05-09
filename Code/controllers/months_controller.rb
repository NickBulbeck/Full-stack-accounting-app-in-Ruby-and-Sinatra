require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/categories.rb' )
require_relative( '../models/transactions.rb' )
require_relative( '../models/months.rb')


get '/months' do
  @months = Month.display_all
  erb ( :"months/index" )
end

get '/months/:id' do 
  @month = Month.find_by_id( params[:id] )
  @transactions = Transaction.display_by_month(@month.name)
  erb( :"months/show" )
end

