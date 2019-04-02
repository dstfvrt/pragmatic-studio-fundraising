class Project

  attr_accessor :name
  attr_reader :funding, :funding_target

  def initialize(name, funding=1000, funding_target=10000)
    @name = name.capitalize
    @funding = funding
    @funding_target = funding_target
  end

  def add_funds(amount)
    @funding += amount
    puts "Project #{@name} added funds!"
  end

  def remove_funds(amount)
    @funding -= amount
    puts "Project #{@name} lost funds!"
  end

  def funds_needed
    @funding_target - @funding
  end

  def to_s
    "Project: #{@name}\tFunds needed: #{funds_needed}"
  end
end


if __FILE__ == $0
  alpha = Project.new("Alpha", 1200, 1800)
  alpha.add_funds(400)
  puts Alpha
end
