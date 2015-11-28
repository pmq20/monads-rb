require 'maybe'
require 'minitest/autorun'

class MonadTest < Minitest::Test
  def test_left_identity_law
    assert_equal 1.maybe.
  end

  def test_right_identity_law
    assert_equal 0, 0
  end

  def test_associativity_law
    assert_equal 0, 0
  end
end
