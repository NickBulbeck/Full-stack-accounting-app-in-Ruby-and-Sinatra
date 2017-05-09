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

  def Month.display_all
    sql = "
      SELECT * FROM months;
    "
    pg_output = SqlRunner.run(sql)
    months = unpack_array(pg_output)
    return months
  end

  def self.unpack_array(pg_output)
    month_hashes = pg_output.map {
      |month_hash|
      Month.new(month_hash)
    }
    return month_hashes
  end

  def Month.find_by_id(search_id)
    sql = "
      SELECT * FROM months WHERE id = #{search_id}
    "
    pg_output = SqlRunner.run(sql)
    month = unpack_array(pg_output)
    return month[0]
  end

end