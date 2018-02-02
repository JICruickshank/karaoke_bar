require("minitest/autorun")
require("minitest/rg")
require_relative("../songs.rb")
class TestSong < MiniTest::Test

  def setup

    @song = Song.new("The Gambler")

  end

  def test_song_has_title

    assert_equal("The Gambler", @song.title)

  end




end
