class CoffeeError < StandardError

  def message
    puts "try again"
  end
end 
class CoffeeFruitError < StandardError
  def message 
    "error not a fruit"
  end
end
class DescriptiveError < StandardError
  def message 
    "this is not a real friendship"
  end
end
# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    puts e.message
    nil
  end
end

# str = "hello"
# p convert_to_int(str)

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"

  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise CoffeeFruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeFruitError => f
    puts f.message
  rescue  CoffeeError => e
    puts e.message
    retry
  end
end  

# p feed_me_a_fruit

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise DescriptiveError if yrs_known  < 5 || name.length <= 0 || fav_pastime.length <= 0
    @name = name
    @yrs_known = yrs_known 
    @fav_pastime = fav_pastime
    
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


