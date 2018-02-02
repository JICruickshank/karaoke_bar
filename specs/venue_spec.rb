require("minitest/autorun")
require("minitest/rg")
require_relative("../venue.rb")
require_relative("../rooms.rb")

class TestVenue < MiniTest::Test

  def setup

    @room = Room.new("Room 1", 5, [])
    @room2 = Room.new("Bar", 5, [])
    @room.takings = 10
    @room2.takings = 20
    @venue = Venue.new("The Infinite Loop", [@room, @room2], 20)
    @present = []

  end

  def test_venue_name

    assert_equal("The Infinite Loop", @venue.name)

  end

  def test_venue_rooms

    assert_equal([@room, @room2], @venue.rooms)

  end

  def test_venue_capacity

    assert_equal(20, @venue.capacity)

  end

  def test_check_takings

    @venue.check_takings
    assert_equal(30, @venue.takings)

  end



end
