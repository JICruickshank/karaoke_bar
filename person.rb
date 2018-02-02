class Person

  attr_reader :name, :fave_song
  attr_accessor :location

  def initialize(name, fave_song)

    @name = name
    @fave_song = fave_song
    @location = "None"

  end

end
