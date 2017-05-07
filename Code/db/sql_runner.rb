require('pg')

class SqlRunner

  def SqlRunner.run(sql)
    begin
      db = PG.connect({dbname: 'money_cashboard',host: 'localhost'})
      result = db.exec(sql)
    ensure
      db.close()
    end
    return result
  end

end