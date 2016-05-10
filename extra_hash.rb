class ::Hash
  def nested_hash_value(key) 
    obj = self
    if obj.respond_to?(:key?) && obj.key?(key) && !obj[key].is_a?(Hash)
      obj[key]
    elsif obj.respond_to?(:each)
      result = nil
      obj.find { |child| result = child.last.nested_hash_value(key) }
      result
    end
  end
end
