require('minitest/autorun')
require('minitest/rg')

require_relative('../transactions.rb')

class TestTransactions < MiniTest::Test

  def setup
    @test_transaction = Transaction.new({
      'transaction_date' => '2017-05-01',
      'payee' => 'Co-Op',
      'amount' => 5.41,
      'category_id' => 1 
    })
  end

  def test_can_create_transaction
    test_transaction = Transaction.new({
      'transaction_date' => '2017-05-01',
      'payee' => 'Co-Op',
      'amount' => 5.41,
      'category_id' => 1 
    })
  end

  def test_can_read_transaction_date
    result = @test_transaction.transaction_date
    assert_equal("2017-05-01",result)
  end

  def test_can_read_payee
    result = @test_transaction.payee
    assert_equal("Co-Op",result)
  end

  def test_can_read_amount
    result = @test_transaction.amount
    assert_equal(5.41,result)
  end

  def test_can_read_category_id
    result = @test_transaction.category_id
    assert_equal(1,result)
  end

  def test_can_read_hardcoded_id
    test_transaction = Transaction.new({
      'id' => 1,
      'transaction_date' => '2017-05-01',
      'payee' => 'Co-Op',
      'amount' => 5.41,
      'category_id' => 1 
    })
    result = test_transaction.id
    assert_equal(1,result)
  end
end




