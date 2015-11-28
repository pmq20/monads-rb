# a Monad object represents computations defined as sequences of steps.
class Monad
  def self.unit(value)
    new(value)
  end

  def bind(operation, *arguments, &block)
    case operation
    when UnboundMethod
      operation.bind(@value).call(*arguments, &block)
    when Method, Proc
      operation.call(@value, *arguments, &block)
    when String
      @value.send(operation, *arguments, &block)
    else
      fail 'Unsupported operation type'
    end
  end

  def method(name)
    if @value.class.instance_methods.include?(name.to_sym)
      operation = @value.class.instance_method(name)
    else
      operation = name.to_s
    end
    proc do |*arguments, &block|
      new_value = bind(operation, *arguments, &block)
      self.class.unit new_value
    end
  end

  def just
    @value
  end

  protected

  def initialize(value)
    @value = value
  end

  def method_missing(name, *arguments, &block)
    method(name).call(*arguments, &block)
  end
end
