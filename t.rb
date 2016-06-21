

puts
puts "RUBY_VERSION: #{RUBY_VERSION.inspect}"


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


## active_support without core_ext

puts 'requiring active_support ...'

require 'active_support'

t = Time.now
t == nil # does it fail?

MyClass.new.test0
MyClass.new.test1
MyClass.new(nil).test0
MyClass.new(nil).test1 rescue nil


## core_ext/time/calculations.rb

puts 'requiring active_support/core_ext/time/calculations.rb ...'

require 'active_support/core_ext/time/calculations.rb'

t == nil # does it fail?

MyClass.new.test0
MyClass.new.test1
MyClass.new(nil).test0
MyClass.new(nil).test1 rescue nil


## core_ext/date_time/calculations.rb

puts 'requiring active_support/core_ext/date_time/calculations.rb ...'

require 'active_support/core_ext/date_time/calculations.rb'

t == nil # does it fail?

MyClass.new.test0
MyClass.new.test1
MyClass.new(nil).test0
MyClass.new(nil).test1 rescue nil


## over

puts "no problem."
puts

