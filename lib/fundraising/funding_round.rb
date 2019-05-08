require_relative 'die'
require_relative 'pledge'

module Fundraising
  module FundingRound
    def self.update(project)
      @die = Die.new
      @die.roll
      if @die.number % 2 == 0
        project.add_funds(100)
      else
        project.remove_funds(100)
      end

      if project.funds_needed <= 0
        puts "#{project.name} is fully funded!"
      else
        pledge = Donations.random
        project.pledges(pledge)
      end
    end
  end
end
