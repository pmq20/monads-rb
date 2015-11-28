module Maybe
  def unit
    'unit'
  end
  
  def bind
    'bind'
  end
end

Object.include(Maybe)
