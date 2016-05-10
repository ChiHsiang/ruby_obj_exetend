class ::Hash
  def nested_hash_value(obj, key) 
    if obj.respond_to?(:key?) && obj.key?(key) )
      obj[key]
    elsif obj.respond_to?(:each)
      result = nil
      obj.find { |*child| result = nested_hash_value(child.last, key) }
      result
    end
  end
end
