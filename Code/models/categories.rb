require('pg')
require_relative('../db/sql_runner.rb')

class Category

  attr_reader :id, :name, :budget

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @budget = params['budget'].to_i
  end


end