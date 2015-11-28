# A monad is an object constructed by a unit operation.
class Monad < BasicObject
  private
  # when doing binding, there is an old monad object, that is, `self`.
  # And there is a method that will return a new monad object.
  def bind(&block)
    
  end

  def method_missing(method, *arguments, &block)
  end
end
