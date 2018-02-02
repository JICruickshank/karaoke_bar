require("minitest/autorun")
require("minitest/rg")
require_relative("../person.rb")

class TestPerson < MiniTest::Test

  def setup

    @person = Person.new("Ian", "I Wanna Be Adored")

  end

  def test_person_has_name

    assert_equal("Ian", @person.name)

  end

  def test_person_has_fave_song

    assert_equal("I Wanna Be Adored", @person.fave_song)
    
  end
end
