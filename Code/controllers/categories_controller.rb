require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/categories.rb' )
require_relative( '../models/transactions.rb' )

get '/categories' do
  @categories = Category.display_all
  erb ( :"categories/index" )
end

get '/categories/new' do
  erb(:"categories/new")
end

get '/categories/:id' do 
  @category = Category.find_by_id( params[:id] )
  @transactions = Transaction.display_by_category(@category.id)
  erb( :"/categories/show" )
end

post '/categories' do
  category = Category.new(params)
  category.save
  redirect to("/categories")
end

post '/categories/:id/delete' do
  Category.destroy(params[:id])
  redirect to("/categories")
end

get '/categories/:id/edit' do
  id_in = params['id']
  # params[:id] is better
  search_id = id_in.to_i
  @category = Category.find_by_id(search_id)
  erb(:"/categories/edit")
end

post '/categories/:id' do
  Category.new( params ).update
  redirect to '/categories'
end







