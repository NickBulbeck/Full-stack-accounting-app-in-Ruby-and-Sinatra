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

  def update(params)
    sql = "
    "

  end

  def delete()
    sql = "
      DELETE FROM transactions WHERE
      id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def Transaction.find_by_id(search_id)
    sql = "
      SELECT * FROM transactions WHERE
      id = #{search_id};
    "
    transaction_hashes = SqlRunner.run(sql)
    transaction_hash = transaction_hashes.first()
    transaction = Transaction.new(transaction_hash)
    return transaction
  end

  def Transaction.display_all
    sql = "
      SELECT * FROM transactions;
    "
    result = SqlRunner.run(sql)
    transaction_hashes = result.map {
      |transaction_hash|
      Transaction.new(transaction_hash)
    }
    return transaction_hashes
  end

  # def Transaction.display_by_month(search_month)

  # end

  # def Transaction.display_between_dates(start_date,end_date)
  # end
  
end





