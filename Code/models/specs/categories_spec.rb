require('minitest/autorun')
require('minitest/rg')

require_relative('../categories.rb')

class TestCategories < MiniTest::Test

  def setup
    @test_category = Category.new({
      'name' => "Groceries",
      'budget' => 5200
      })
  end

  def test_can_create_category
    test_category = Category.new({
      'name' => "Groceries",
      'budget' => 5200
      })
  end

  def test_can_read_name
    result = @test_category.name
    assert_equal(result,"Groceries")
  end 

  def test_can_read_budget
    result = @test_category.budget
    assert_equal(result,5200)
  end

  def test_can_read_hardcoded_id
    test_category = Category.new({
      'id' => 1,
      'name' => "Groceries",
      'budget' => 5200
      })
    result = test_category.name
    assert_equal(result,"Groceries")
  end

end