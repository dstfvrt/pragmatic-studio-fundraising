require_relative "pledge"
class Project

  attr_accessor :name, :funding, :funding_target

  def initialize(name, funding=1000, funding_target=10000)
    @name = name.capitalize
    @funding = funding
    @funding_target = funding_target
    @pledges = Hash.new(0)
  end

  def add_funds(amount)
    self.funding += amount
    puts "Project #{name} added funds!"
  end

  def remove_funds(amount)
    self.funding -= amount
    puts "Project #{name} lost funds!"
  end

  def funds_needed
    funding_target - funding
  end

  def pledges(pledge)
    @pledges[pledge.name] += pledge.amount
    @funding += pledge.amount
    puts "#{project.name} received a #{pledge.name} worth #{pledge.amount}!"
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
