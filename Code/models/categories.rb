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



end