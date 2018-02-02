require("minitest/autorun")
require("minitest/rg")
require_relative("../venue.rb")
require_relative("../rooms.rb")
require_relative("../person.rb")

class TestVenue < MiniTest::Test

  def setup

    @room = Room.new("Room 1", 5, [])
    @room2 = Room.new("Bar", 5, [])
    @room.takings = 10
    @room2.takings = 20
    @venue = Venue.new("The Infinite Loop", [@room, @room2], 20, 10, 5)
    @present = []
    @takings = 0
    @queue = []

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

  def test_allow_entry

    @person = Person.new("Ian", @song, 20)
    @venue.allow_entry(@person)
    assert_equal([@person], @venue.present)
    assert_equal(10, @venue.takings)
    assert_equal(10, @person.cash)

  end

  def test_allow_entry__at_capacity__add_to_queue

    @venue = Venue.new("The Infinite Loop", [@room, @room2], 1, 10, 5)
    @person = Person.new("Ian", @song, 20)
    @person2 = Person.new("Liam", @song2, 30)
    @queue = []
    @venue.allow_entry(@person)
    @venue.allow_entry(@person2)
    assert_equal([@person2], @venue.queue)
  end

  def test_allow_entry_no_money

    @person6 = Person.new("Tom", @song8, 5)
    assert_equal(false, @venue.allow_entry(@person6))
  end




end
