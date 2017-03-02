class Object
  def self.const_missing(c)
    return nil if @calling_const_missing
    @calling_const_missing = true
    puts "Missing constant: #{c.inspect}!, with #{Rulers.to_underscore(c.to_s)}"
    require Rulers.to_underscore(c.to_s)
    klass = Object.const_get(c)
    @calling_const_missing = false
    klass
    # STDERR.puts "Missing constant: #{c.inspect}!"
  end
end
