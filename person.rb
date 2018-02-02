class Person

  attr_reader :name, :fave_song
  attr_accessor :location

  def initialize(name, fave_song)

    @name = name
    @fave_song = fave_song
    @location = "None"

  end

  def fave_song_on_playlist(room)

    room.playlist.each do |song|

      if song == @fave_song
        return true
      end
    end
    return false
  end

end
