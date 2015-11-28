# a Monad object represents computations defined as sequences of steps.
class Monad
  def self.unit(value)
    self.new(value)
  end

  def bind(operation, *arguments, &block)
    case operation
    when UnboundMethod
      operation.bind(@value).call(*arguments, &block)
    when Method, Proc
      operation.call(@value, *arguments, &block)
    else
      raise 'Unsupported operation supplied'
    end
  end

  def method(name)
    Proc.new do |*arguments, &block|
      new_value = bind(@value.class.instance_method(name), *arguments, &block)
      self.class.unit new_value
    end
  end

  def just
    @value
  end

  private

  def initialize(value)
    @value = value
  end

  def method_missing(name, *arguments, &block)
    method(name).call(*arguments, &block)
  end
end
