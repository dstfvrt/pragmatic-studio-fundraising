require_relative "project"

class GrantProject < Project

  def remove_funds(amount=100)
    puts "Funds cannot be removed from #{name}!"
  end
end
