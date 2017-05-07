require('pg')
require_relative('../db/sql_runner.rb')

class Month

attr_reader :id, :name, :start_date, :end_date

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @start_date = params['start_date']
    @end_date = params['end_date']
  end

  def Month.delete_all()
    sql = "
      DELETE FROM months;
    "
    SqlRunner.run(sql)
  end

end