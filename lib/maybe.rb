require 'monad'

# Maybe is a special Monad object that represents a value
# that is either a single value, or no value at all.
class Maybe < Monad
  def self.unit(value)
    super.tap do |monad|
      monad.instance_variable_set('@is_nil', true) if value.nil?
    end
  end
  
  def bind(operation, *arguments, &block)
    return self if @is_nil
    super
  end

  protected

  def method_missing(name, *arguments, &block)
    return self if @is_nil
    super
  end
end

# Add #maybe to Object so that calling #maybe on any object
# will guard the future method calls against the null value nil.
Object.send(:define_method, :maybe) { Maybe.unit(self) }
