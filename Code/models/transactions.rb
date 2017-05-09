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

  def update()
    sql = "
      UPDATE transactions SET
      (transaction_date,payee,amount,category_id) =
      ('#{@transaction_date}',
       '#{@payee}',
       '#{@amount}',
       '#{@category_id}'
      )
      WHERE id = #{@id}
    "
    SqlRunner.run(sql)
  end


  def Transaction.destroy(kill_id)
    sql = "
      DELETE FROM transactions WHERE
      id = #{kill_id}
    "
    SqlRunner.run(sql)
  end

  def Transaction.find_by_id(search_id)
    sql = "
      SELECT * FROM transactions WHERE
      id = #{search_id};
    "
    pg_output = SqlRunner.run(sql)
    transaction = unpack_array(pg_output)
    return transaction[0]
  end

  def Transaction.display_all
    sql = "
      SELECT * FROM transactions
      ORDER BY transaction_date ASC;
    "
    pg_output = SqlRunner.run(sql)
    transactions = unpack_array(pg_output)
    return transactions
  end

  def Transaction.display_by_month(search_month)
    sql = "SELECT * FROM transactions WHERE
        transaction_date >=
          (SELECT start_date FROM months WHERE
          name = '#{search_month}')
      AND
        transaction_date <=
          (SELECT end_date FROM months WHERE
           name = '#{search_month}')
           ORDER BY transaction_date ASC;
    "
    pg_output = SqlRunner.run(sql)
    transactions = unpack_array(pg_output)
    return transactions
  end

  def Transaction.total_by_month(search_month)
    sql = "SELECT SUM(amount) FROM transactions WHERE
        transaction_date >=
          (SELECT start_date FROM months WHERE
          name = '#{search_month}')
      AND
        transaction_date <=
          (SELECT end_date FROM months WHERE
           name = '#{search_month}');
    "
    pg_output = SqlRunner.run(sql)
    total_spend = pg_output[0]["sum"].to_f

    return total_spend
  end

# Never got around to using this one, but it's interesting anyway:
  def Transaction.display_by_dates(start_date,end_date)
    sql = "
      SELECT * FROM transactions WHERE
       transaction_date >= '#{start_date}'
       AND
       transaction_date <= '#{end_date}';
    "
    pg_output = SqlRunner.run(sql)
    transactions = unpack_array(pg_output)
    return transactions
  end

  def Transaction.display_by_category(search_id)
    sql = "
      SELECT * FROM transactions WHERE
       category_id = #{search_id}
       ORDER BY transaction_date ASC;
    "
    pg_output = SqlRunner.run(sql)
    transactions = unpack_array(pg_output)
    return transactions
  end


  def self.unpack_array(pg_output)
    transaction_hashes = pg_output.map {
      |transaction_hash|
      Transaction.new(transaction_hash)
    }
    return transaction_hashes
  end

  def Transaction.total_spend()
    sql = "
    SELECT SUM(amount) FROM transactions;
    "
    pg_output = SqlRunner.run(sql)
    total_spend = pg_output[0]["sum"].to_f
# .to_f because it may be useful to perform
# arithmetic functions with it...
    return total_spend
  end


end





