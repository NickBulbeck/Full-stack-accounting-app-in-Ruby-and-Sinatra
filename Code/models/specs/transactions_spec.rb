require('minitest/autorun')
require('minitest/rg')

require_relative('../transactions.rb')

class TestTransactions < MiniTest::Test

  def setup
    # @transaction1 = Transaction.new()
  end

  def test_can_create_transaction
    test_transaction = Transaction.new({
      'transaction_date' => '2017-05-01',
      'payee' => 'Co_op',
      'amount' => 5.41,
      'category_id' => 1 
    })

  end

end