require 'minitest/autorun'
require './lib/passenger'

class PassengerTest < Minitest::Test

  def test_it_exists
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    assert_instance_of Passenger, charlie
  end

  def test_it_has_a_name_and_age
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    assert_equal "Charlie", charlie.name
    assert_equal 18, charlie.age
  end

  def test_it_knows_if_adult
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    assert_equal false, taylor.adult?
    assert charlie.adult?
  end

  def test_it_starts_as_not_a_driver_and_can_become_one_after_driving
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    assert_equal false, charlie.driver?
    charlie.drive

    assert charlie.driver?
  end


end
