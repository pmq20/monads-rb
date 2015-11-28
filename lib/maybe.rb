require 'monad'

# A module to be included by Object so that calling #maybe on any object
# will guard the future method calls against the null value nil.
module Maybe
  # the method #maybe serves as the unit function used to construct a monad
  def maybe
    Monad.new.tap do |monad|
    end
  end
end

Object.include(Maybe)
