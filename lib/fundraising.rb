class Project
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

  def to_s
    "Project: #{@name}\tFunding: #{@funding}\t Funding Target: #{@funding_target}"
  end
end

alpha = Project.new("alpha", 10000, 100000)
puts alpha
beta = Project.new("beta")
puts beta
beta.add_funds(200)
puts beta
gamma = Project.new("gamma", 400, 1200)
puts gamma
gamma.remove_funds(120)
puts gamma
