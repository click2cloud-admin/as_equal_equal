
require 'active_support'

puts "RUBY_VERSION: #{RUBY_VERSION.inspect}"


## active_support without core_ext

t = Time.now
t == nil # does it fail?

class MyClass
  def initialize(sa=Time.now)
    @started_at = sa
  end
  def test0
    @started_at == nil
  end
  def test1
    fail ArgumentError.new('blah blah') if @started_at == nil
  end
end

MyClass.new.test0
MyClass.new.test1
MyClass.new(nil).test0
MyClass.new(nil).test1 rescue nil

