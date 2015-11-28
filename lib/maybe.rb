require 'monad'

# A module to be included by Object so that calling #maybe on any object
# will guard the future method calls against the null value nil.
module Maybe
  # the method #maybe serves as the unit function used to construct a monad,
  # the value to be remembered by this monad is just `self`.
  def maybe
    Monad.new(self)
  end
end

Object.include(Maybe)
