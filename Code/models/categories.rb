require('pg')
require_relative('../db/sql_runner.rb')

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

  def delete()
    sql = "
      DELETE FROM categories WHERE
      id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def Category.find_by_id(search_id)
    sql = "
      SELECT * FROM categories WHERE
      id = #{search_id};
    "
    category_hashes = SqlRunner.run(sql)
    category_hash = category_hashes.first()
    category = Category.new(category_hash)
    return category
  end

  def Category.display_all
    sql = "
      SELECT * FROM categories;
    "
    search_output = SqlRunner.run(sql)
    category_hashes = search_output.map {
      |category_hash|
      Category.new(category_hash)
    }
    return category_hashes
  end

  def display_all_transactions(search_id)
    sql = "
      SELECT * FROM transactions WHERE
      category_id = #{search_id}
    "
    search_output = SqlRunner.run(sql)
    transaction_hashes = search_output.map {
      |transaction_hash| Transaction.new(transaction_hash)
    }
    return transaction_hashes
  end

end






