require 'minitest/autorun'
require './lib/passenger'
require './lib/vehicle'

class VehicleTest < Minitest::Test

  def test_it_exists
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_instance_of Vehicle, vehicle
  end

  def test_it_has_year_make_model
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal "2001", vehicle.year
    assert_equal "Honda", vehicle.make
    assert_equal "Civic", vehicle.model
  end

  def test_it_starts_not_speeding_but_can

    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal false, vehicle.speeding?
    vehicle.speed
    assert vehicle.speeding?
  end

  def test_vehicle_starts_with_no_passengers
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal [], vehicle.passengers
  end

  def test_it_can_add_passengers
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)
    assert vehicle.passengers.all?{|psgr| psgr.class == Passenger}
    assert_equal ["Charlie", "Jude", "Taylor"],
    vehicle.passengers.map{|psgr| psgr.name}
  end

  def test_it_knows_how_many_adults_it_contains
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)

    assert_equal 2, vehicle.num_adults?
  end




end
