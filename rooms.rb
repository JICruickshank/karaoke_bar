class Room

  attr_reader :name, :capacity
  attr_accessor :playlist, :present, :queue, :takings

  def initialize(name, capacity, present)

    @name = name
    @playlist = []
    @capacity = capacity
    @present = present
    @queue = []
    @takings = 0

  end


  def add_song_to_playlist(song)

    @playlist << song

  end

  def remove_song_from_playlist(song)

    @playlist.delete(song)

  end

  def allow_in

    if @present.length < @capacity
      return true
    else
      return false
    end

  end

  def add_person_to_room(person)

    if allow_in == true
      @present << person
      person.location = @name
    else
      @queue << person
      person.location = "#{@name} queue"
    end

  end

  def remove_person_from_room(person)

    person.location = "None"
    @present.delete(person)

  end

  def sell_drink(person, price)

    person.cash -= price
    @takings += price

  end








end
