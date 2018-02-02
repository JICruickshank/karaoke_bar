class Room

  attr_reader :name, :capacity
  attr_accessor :playlist :present

  def initialize(name, playlist, capacity, present)

    @name = name
    @playlist = playlist
    @capacity = capacity
    @present = present

  end


end
