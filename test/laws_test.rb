require 'monad'
require 'minitest/autorun'

class MonadTest < Minitest::Test
  def setup
    Object.include(Monad) unless Object.include?(Monad)
  end

end
