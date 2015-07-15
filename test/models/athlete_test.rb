require 'test_helper'

class AthleteTest < ActiveSupport::TestCase
  def setup
    @athlete = athletes(:one)
  end

  test "fixture is valid" do
    assert @athlete.valid?
  end

  test "sport can't be blank" do
    @athlete.sport = nil
    refute @athlete.valid?
    assert @athlete.errors.keys.include?(:sport)
  end

  test "weight can't be blank" do
    @athlete.weight = nil
    refute @athlete.valid?
    assert @athlete.errors.keys.include?(:weight)
  end

  test "height can't be blank" do
    @athlete.height = nil
    refute @athlete.valid?
    assert @athlete.errors.keys.include?(:height)
  end

  test "personal record can't be blank" do
    @athlete.personal_record = nil
    refute @athlete.valid?
    assert @athlete.errors.keys.include?(:personal_record)
  end

  test "name can't be blank" do
    @athlete.name = nil
    refute @athlete.valid?
    assert @athlete.errors.keys.include?(:name)
  end
end
