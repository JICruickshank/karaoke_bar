require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms.rb")
require_relative("../songs.rb")

class TestRoom < MiniTest::Test

  def setup

    @song1 = Song.new("Red Red Wine")
    @song2 = Song.new("Rapper's Delight")
    @playlist = [@song1, @song2]
    @person1 = Person.new("Liam", "Supersonic"
    @person2 = Person.new("Damon", "Coffee and TV")
    @present = [@person1, @person2]
    @room = Room.new("Room 1", @playlist, 5)

  end

  def test_room_has_name

    assert_equal("Room 1", @room.name)

  end

  def test_room_has_playlist

    assert_equal(2, @room.playlist.length)

  end

  def test_room_has_capacity

    assert_equal(5, @room.capacity)

  end

  def test_room_has_people

    assert_equal(2, @room.present.length)

  end



end
