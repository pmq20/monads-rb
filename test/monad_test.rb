require 'monad'
require 'minitest/autorun'

# cf. https://wiki.haskell.org/Monad_laws
class MonadTest < Minitest::Test
  def test_left_identity_law
    f = Monad.unit(1).method(:<<)
    assert_equal (1 << 10), f.call(10).just
    assert_equal (1 << 10), Monad.unit(10).bind(f).just
  end

  def test_right_identity_law
    monad = Monad.unit(1)
    assert_equal monad.bind(Monad.method(:unit)).just,
                 monad.just
  end

  def test_associativity_law
    f = Monad.unit(1).method(:<<)
    g = Monad.unit(2).method(:**)
    fg = lambda { |x| f.call(x).bind(g) }
    assert_equal (2 ** (1 << 3)), Monad.unit(3).bind(f).bind(g).just
    assert_equal (2 ** (1 << 3)), Monad.unit(3).bind(fg).just
  end
end
