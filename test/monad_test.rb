require 'maybe'
require 'minitest/autorun'

# This makes sure that our `Maybe` monads obey the three monad laws
# cf. http://www.haskell.org/haskellwiki/Monad_laws
class MonadTest < Minitest::Test
  def test_left_identity_law
    f = 1.maybe.method(:<<)
    assert_equal 10.maybe.bind(f).just,
                 f.call(10).just
  end

  def test_right_identity_law
    monad = 1.maybe
    assert_equal monad.bind(Maybe.instance_method(:maybe)).just,
                 monad.just
  end

  def test_associativity_law
    f = 1.maybe.method(:<<)
    g = 2.maybe.method(:**)
    fg = proc { |x| f(x).bind(g) }
    assert_equal 3.maybe.bind(f).bind(g).just,
                 3.maybe.bind(fg).just
  end
end
