# A module to be included by Object so that calling #maybe on any object
# will guard the future method calls against the null value nil.
module Maybe
  def maybe
    Monad.unit(self)
  end
end

Object.include(Maybe)
