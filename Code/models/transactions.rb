require('pg')
require_relative('../db/sql_runner.rb')

class Transaction

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @transacion_date = params['transaction_date']
    @payee = params['payee']
    @amount = params['amount'].to_f
    @category_id = params['category_id'].to_i
  end

end