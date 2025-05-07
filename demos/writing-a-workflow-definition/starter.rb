require_relative 'greeting'

def run(name)
  greeter = GreetSomeone.new
  greeting = greeter.execute(name)
  puts greeting
end

name = ARGV[0]
run(name)
