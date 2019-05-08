require_relative "pledge"
require_relative "fundable"

module Fundraising
  class Project
    include Fundable

    attr_accessor :name, :funding, :funding_target

    def initialize(name, funding=1000, funding_target=10000)
      @name = name.capitalize
      @funding = funding
      @funding_target = funding_target
      @pledges = Hash.new(0)
    end

    def pledges(pledge)
      @pledges[pledge.name] += pledge.amount
      @funding += pledge.amount
      puts "#{name} received a #{pledge.name} pledge worth #{pledge.amount}!"
    end

    def each_pledge
      @pledges.each do |name, amount|
        yield Pledge.new(name, amount)
      end
    end

    def to_s
      "Project: #{name}\tFunds needed: #{funds_needed}"
    end

    def <=> (other)
      funds_needed <=> other.funds_needed
    end
  end

  if __FILE__ == $0
    alpha = Project.new("Alpha", 1200, 1800)
    alpha.add_funds(400)
    puts Alpha
  end
end
