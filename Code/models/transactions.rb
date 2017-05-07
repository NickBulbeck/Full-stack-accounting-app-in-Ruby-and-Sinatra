require('pg')
require_relative('../db/sql_runner.rb')

class Transaction

  attr_reader :id, :transaction_date, :payee, :amount, :category_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @transaction_date = params['transaction_date']
    @payee = params['payee']
    @amount = params['amount'].to_f
    @category_id = params['category_id'].to_i
  end

  def Transaction.delete_all()
    sql = "
      DELETE FROM transactions;
    "
    SqlRunner.run(sql)
  end

  def save()
    sql = "
      INSERT INTO transactions
        (transaction_date,payee,amount,category_id)
      VALUES
        ('#{@transaction_date}',
         '#{@payee}',
         '#{@amount}',
         '#{@category_id}'
          )
      RETURNING *
      ;"
    transaction_data = SqlRunner.run(sql)
    @id = transaction_data.first()['id'].to_i
  end

end





