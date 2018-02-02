class Venue

  attr_reader :name, :rooms, :capacity
  attr_accessor :takings

  def initialize(name, rooms, capacity)

    @name = name
    @rooms = rooms
    @capacity = capacity
    @takings = 0

  end

  def check_takings

    @rooms.each {|room| @takings += room.takings}
    p @takings

  end

end
