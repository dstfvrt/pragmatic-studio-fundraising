module Fundraising
  class Die

    attr_reader :number
  
    def initialize
      @number = roll
    end

    def roll
      @number = rand(1..6)
    end
  end
end
