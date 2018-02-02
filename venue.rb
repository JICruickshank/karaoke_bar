class Venue

  attr_reader :name, :rooms, :capacity
  attr_accessor :takings, :entry_fee, :drink_price, :present

  def initialize(name, rooms, capacity, entry_fee, drink_price)

    @name = name
    @rooms = rooms
    @capacity = capacity
    @takings = 0
    @entry_fee = 10
    @drink_price = 5
    @present = []


  end

  def check_takings

    @rooms.each {|room| @takings += room.takings}

  end

  def allow_entry(person)

    if person.cash >= person.cash
      @present << person
      @takings += @entry_fee
      person.cash -= @entry_fee
    end


  end

end
