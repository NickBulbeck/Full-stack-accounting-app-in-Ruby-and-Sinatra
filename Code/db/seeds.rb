require_relative('../models/categories.rb')
require_relative('../models/transactions.rb')
require_relative('./sql_runner.rb')
require('pry-byebug')

Transaction.delete_all()
Category.delete_all()
# The months table is initialized in the SQL itself,
# since a month is effectively a constant

  @groceries = Category.new({
      "name" => "Groceries",
      "budget" => 5200
    })
  @groceries.save()
  @travel = Category.new({
      "name" => "Travel",
      "budget" => 2500
    })
  @travel.save()
  @clothing = Category.new({
      "name" => "Clothing",
      "budget" => 200
    })
  @clothing.save()
  @weans = Category.new({
      "name" => "Weans",
      "budget" => 3000
    })
  @weans.save()
  @leisure = Category.new({
      "name" => "Leisure",
      "budget" => 1000
    })
  @leisure.save()

  @transaction1 = Transaction.new({
    "transaction_date" => "2017_01_02",
    "payee" => "Co-Op",
    "amount" => 8.32,
    "category_id" => @groceries.id
    })
  @transaction1.save()
  @transaction2 = Transaction.new({
    "transaction_date" => "2017_05_08",
    "payee" => "Beatsons",
    "amount" => 16.22,
    "category_id" => @leisure.id
    })
  @transaction2.save()
binding.pry

puts "Test-run complete"