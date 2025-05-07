# frozen_string_literal: true

require_relative 'workflow'

def run(name)
  greeter = GreetSomeone.new
  greeting = greeter.run(name)
  puts greeting
end

name = ARGV[0]
run(name)
