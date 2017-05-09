require('pg')
require_relative('../db/sql_runner.rb')
require_relative('./transactions.rb')

class Category

  attr_reader :id, :name, :budget

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @budget = params['budget'].to_i
  end

  def Category.delete_all()
    sql = "
      DELETE FROM categories;
    "
    SqlRunner.run(sql)
  end

  def save()
    sql = "
      INSERT INTO categories
        (name,budget)
      VALUES
        ('#{@name}',
         '#{@budget}'
          )
      RETURNING *
      ;"
    category_data = SqlRunner.run(sql)
    @id = category_data.first()['id'].to_i
  end

  def update()
    sql = "
      UPDATE categories SET
      (name,budget) =
      ('#{@name}',
       '#{@budget}'
      )
      WHERE id = #{@id}
    "
    SqlRunner.run(sql)
  end

  def is_in_use()
    sql = "
      SELECT * FROM transactions WHERE
      category_id = #{@id}
    "
    uses = SqlRunner.run(sql)
    if uses.count > 0
      return true
    else
      return false
    end
  end


  def Category.destroy(kill_id)
    sql = "
      DELETE FROM categories WHERE
      id = #{kill_id}
    "
    SqlRunner.run(sql)
  end

  def Category.find_by_id(search_id)
    sql = "
      SELECT * FROM categories WHERE
      id = #{search_id};
    "
    pg_output = SqlRunner.run(sql)
    category = unpack_array(pg_output)
    return category[0]
  end

  def Category.display_all
    sql = "
      SELECT * FROM categories
      ORDER BY name ASC;
    "
    pg_output = SqlRunner.run(sql)
    categories = unpack_array(pg_output)
    return categories
  end

  def display_all_transactions()
    sql = "
      SELECT * FROM transactions WHERE
      category_id = #{@id}
      ORDER BY transaction_date ASC;
    "
    pg_output = SqlRunner.run(sql)
    transactions = Transaction.unpack_array(pg_output)
    return transactions
  end

  def total_spend()
    sql = "
      SELECT SUM(amount) FROM transactions
      WHERE category_id = #{@id}
    "
    pg_output = SqlRunner.run(sql)
    total_spend = pg_output[0]["sum"].to_f
    return total_spend
  end

  def self.unpack_array(pg_output)
    categories = pg_output.map {
      |category_hash|
      Category.new(category_hash)
    }
    return categories
  end

  def Category.total_budget()
    sql = "
    SELECT SUM(budget) FROM categories
    "
    pg_output = SqlRunner.run(sql)
    budget = pg_output[0]["sum"].to_i
    return budget
  end

end






