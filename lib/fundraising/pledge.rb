module Fundraising
  Pledge = Struct.new(:name, :amount)

  module Donations
    extend self

    PLEDGES = [
      Pledge.new(:bronze, 50),
      Pledge.new(:silver, 75),
      Pledge.new(:gold, 100),
      Pledge.new(:platinum, 150)
    ]

    def random
      PLEDGES[rand(4)]
    end
  end
end
