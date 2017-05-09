require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/categories.rb' )
require_relative( '../models/transactions.rb' )


get '/transactions' do
  @transactions = Transaction.display_all
  erb ( :"transactions/index" )
end

get '/transactions/new' do
  @categories = Category.display_all
  erb(:"transactions/new")
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to("/transactions")
end

post '/transactions/:id/delete' do
  Transaction.destroy(params[:id])
  redirect to("/transactions")
end

get '/transactions/:id/edit' do
  id_in = params['id']
  # params[:id] is better
  search_id = id_in.to_i
  @transaction = Transaction.find_by_id(search_id)
  @categories = Category.display_all
  erb(:"/transactions/edit")
end

post '/transactions/:id' do
  Transaction.new( params ).update
  redirect to '/transactions'
end

post '/months/transactions/:id/delete' do
  Transaction.destroy(params[:id])
  redirect to("/transactions")
end








