require("minitest/autorun")
require("minitest/rg")
require_relative("../person.rb")
require_relative("../rooms.rb")
require_relative("../songs.rb")

class TestPerson < MiniTest::Test

  def setup

    @song = Song.new("I Wanna Be Adored")
    @song2 = Song.new("Not Nineteen Forever")
    @person = Person.new("Ian", @song, 20)
    @person2 = Person.new("Liam", @song2, 30)
    @room = Room.new("Room 1", 5, [])


  end

  def test_person_has_name

    assert_equal("Ian", @person.name)

  end

  def test_person_has_fave_song

    assert_equal("I Wanna Be Adored", @person.fave_song.title)

  end

  def test_find_person_location

    assert_equal("None", @person.location)

  end

  def test_fave_song_on_playlist
    @song = Song.new("I Wanna Be Adored")
    @song2 = Song.new("Not Nineteen Forever")
    @person = Person.new("Ian", @song, 20)
    @person2 = Person.new("Liam", @song2, 30)
    @room = Room.new("Room 1", 5, [])
    @room.playlist = [@song]

    # @room.add_song_to_playlist(@song)
    assert_equal(true, @person.fave_song_on_playlist(@room))
    assert_equal(false, @person2.fave_song_on_playlist(@room))

  end

  def test_person_has_cash

    assert_equal(20, @person.cash)
  end







end
