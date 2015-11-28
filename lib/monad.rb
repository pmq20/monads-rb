# A monad is an object used in the following three scenarios
# - there is a unit operation that allocates and returns a new monad object
# - there is an old monad object when doing binding
# - there is a method that will return a new monad object when doing binding
class Monad < BasicObject
  private

  def method_missing(method, *arguments, &block)
  end
end
