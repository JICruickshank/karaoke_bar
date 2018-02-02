require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../person.rb")

class TestRoom < MiniTest::Test

  def setup

    @song1 = Song.new("Red Red Wine")
    @song2 = Song.new("Rapper's Delight")
    @song3 = Song.new("Supersonic")
    @playlist = [@song1, @song2]
    person1 = Person.new("Liam", "Supersonic")
    person2 = Person.new("Damon", "Coffee and TV")
    @person3 = Person.new("Shaun", "Step On")
    @person4 = Person.new("Mick", "Fairground")
    @person5 = Person.new("Tim", "The Only One")
    @person6 = Person.new("Tom", "This Is How It Feels")
    @present = [person1, person2]
    @room = Room.new("Room 1", @playlist, 5, @present)

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

  def test_add_person_to_room

    @room.add_person_to_room(@person3)
    assert_equal(3, @room.present.length)
    assert_equal("Room 1", @person3.location)

  end

  def test_reject_at_capacity

    @room.add_person_to_room(@person3)
    @room.add_person_to_room(@person4)
    @room.add_person_to_room(@person5)
    result = @room.add_person_to_room(@person6)
    assert_equal(false, result)

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



end
