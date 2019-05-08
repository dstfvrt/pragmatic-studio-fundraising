require_relative "project"

module Fundraising
  class GrantProject < Project

    def remove_funds(amount=100)
      puts "Funds cannot be removed from #{name}!"
    end
  end
end
