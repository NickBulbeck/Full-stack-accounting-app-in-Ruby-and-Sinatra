require('minitest/autorun')
require('minitest/rg')

require_relative('../months.rb')

class TestMonths < MiniTest::Test

  def setup
    @test_month = Month.new({
      'name' => "Jan 2017",
      'start_date' => "2017-01-01",
      'end_date' =>"2017-01-31"})
  end

  def test_can_create_month
    test_month = Month.new({
      'name' => "Jan 2017",
      'start_date' => "2017-01-01",
      'end_date' =>"2017-01-31"})
  end

  def test_can_read_name
    result = @test_month.name
    assert_equal("Jan 2017",result)
  end

  def test_can_read_start_date
    result = @test_month.start_date
    assert_equal("2017-01-01",result)
  end

  def test_can_read_end_date
    result = @test_month.end_date
    assert_equal("2017-01-31",result)
  end

  def test_can_read_hardcoded_id
    test_month = Month.new({
      'id' => 1,
      'name' => "Jan 2017",
      'start_date' => "2017-01-01",
      'end_date' =>"2017-01-31"})
    result = test_month.id
    assert_equal(1,result)
  end

end