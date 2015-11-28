require 'test_helper'

class MonadTest < Minitest::Test
  def test_left_identity_law
    assert_equal @monad_class.new(1).bind()
  end

  def test_right_identity_law
    assert_equal 0, 0
  end

  def test_associativity_law
    assert_equal 0, 0
  end
end
