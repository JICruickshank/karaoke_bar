require("minitest/autorun")
require("minitest/rg")
require_relative("../person.rb")
require_relative("../rooms.rb")

class TestPerson < MiniTest::Test

  def setup

    @person = Person.new("Ian", "I Wanna Be Adored")
    @person2 = Person.new("Liam", "Not Nineteen Forever")
    @room = Room.new("Room 1", [], 5, [])

  end

  def test_person_has_name

    assert_equal("Ian", @person.name)

  end

  def test_person_has_fave_song

    assert_equal("I Wanna Be Adored", @person.fave_song)

  end

  def test_find_person_location

    assert_equal("None", @person.location)

  end







end
