require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../person.rb")

class TestRoom < MiniTest::Test

  def setup

    @song1 = Song.new("Red Red Wine")
    @song2 = Song.new("Supersonic")
    @song3 = Song.new("Rapper's Delight")
    @song4 = Song.new("Coffee and TV")
    @song5 = Song.new("Step On")
    @song6 = Song.new("Fairground")
    @song7 = Song.new("The Only One")
    @song8 = Song.new("This Is How It Feels")
    @person1 = Person.new("Liam", @song2, 20)
    @person2 = Person.new("Damon", @song4, 50)
    @person3 = Person.new("Shaun", @song5, 30)
    @person4 = Person.new("Mick", @song6, 40)
    @person5 = Person.new("Tim", @song7, 10)
    @person6 = Person.new("Tom", @song8, 5)
    @present = [@person1, @person2]
    @room = Room.new("Room 1", 5, @present)
    @room.playlist = [@song1, @song2]

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

  def test_allow_in

    @room = Room.new("Room 1", 3, [@person1, @person2])
    @room2 = Room.new("Room 1", 2, [@person1, @person2])
    assert_equal(true, @room.allow_in)
    assert_equal(false, @room2.allow_in)

  end

  def test_add_song_to_playlist

    @room.add_song_to_playlist(@song3)
    assert_equal(3, @room.playlist.length)

  end

  def test_remove_song_from_playlist

    @room.add_song_to_playlist(@song3)
    @room.remove_song_from_playlist(@song1)
    @room.remove_song_from_playlist(@song2)
    assert_equal(1, @room.playlist.length)

  end

  def test_remove_song_from_playlist__not_found

    @room.remove_song_from_playlist(@song3)
    assert_equal(2, @room.playlist.length)

  end

  def test_add_person_to_room

    @song2 = Song.new("Supersonic")
    @song4 = Song.new("Coffee and TV")
    @song5 = Song.new("Step On")
    @person1 = Person.new("Liam", @song2, 20)
    @person2 = Person.new("Damon", @song4, 30)
    @person3 = Person.new("Shaun", @song5, 40)
    @room = Room.new("Room 1", 3, [@person1, @person2])
    @room.add_person_to_room(@person3)
    assert_equal([@person1, @person2, @person3], @room.present)
    assert_equal("Room 1", @person3.location)

  end

  def test_add_person_to_room__at_capacity
    @song2 = Song.new("Supersonic")
    @song4 = Song.new("Coffee and TV")
    @song5 = Song.new("Step On")
    @person1 = Person.new("Liam", @song2, 50)
    @person2 = Person.new("Damon", @song4, 30)
    @person3 = Person.new("Shaun", @song5, 30)
    @room = Room.new("Room 1", 1, [@person2])
    @room.add_person_to_room(@person3)
    assert_equal([@person3], @room.queue)
    assert_equal("Room 1 queue", @person3.location)
  end
  #
  def test_remove_person_from_room

    @room = Room.new("Room 1", 3, [@person1, @person2])
    @room.remove_person_from_room(@person2)
    assert_equal([@person1], @room.present)
    assert_equal("None", @person2.location)

  end

  def test_sell_drink

    @room.sell_drink(@person1, 5)
    assert_equal(15, @person1.cash)

  end

end
