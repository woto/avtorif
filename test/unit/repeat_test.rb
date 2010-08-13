require 'test_helper'

class RepeatTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "Тестируем выражение для крона" do
    assert !Repeat.new.save
    assert Repeat.new(:cron_string => "* * * * * *").valid?
    assert Repeat.new(:cron_string => "* * * * * ").valid?
    assert Repeat.new(:cron_string => "*/10 * * * *  ").valid?
    assert Repeat.new(:cron_string => "  10 10 * * *").valid?
    assert Repeat.new(:cron_string => "10 10 * * * * ").valid?
    assert Repeat.new(:cron_string => "10 */10 1-7 * * *").valid?
    assert Repeat.new(:cron_string => "10 */10 1-7,9-11 * * *").valid?
    assert Repeat.new(:cron_string => "10 1-7,9-11 * * * ").valid?
    assert !Repeat.new(:cron_string => "10 10 * * * * *").valid?
    assert !Repeat.new(:cron_string => "10 */10 * * * * *").valid?
    assert !Repeat.new(:cron_string => "10 1d0 * * * * * ").valid?
    assert !Repeat.new(:cron_string => " 0 */10 * * * *+").valid?
    assert !Repeat.new(:cron_string => " h10 */.10 * * * *+").valid?
    assert Repeat.create(:cron_string => " */8 * * * * ")    
  end
end