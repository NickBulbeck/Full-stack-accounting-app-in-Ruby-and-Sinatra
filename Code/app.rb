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

 @total_spend = Transaction.total_spend
    @total_budget = Category.total_budget
    @prorata_budget = @total_budget / 12
    @current_month = Date.today.month.to_i
    @budget_to_date = @prorata_budget * @current_month

    if @total_spend < @budget_to_date
      @report_text = "You're within budget! Here's a mountain view to celebrate..."
    else
    @report_text = "You're not within budget. To show a nice background image... cut back on your spending!"
      end
 erb( :index )

end