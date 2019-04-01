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

alpha = Project.new("alpha", 10000, 100000)
beta = Project.new("beta")
gamma = Project.new("gamma", 400, 1200)

projects = [alpha, beta, gamma]

puts "There are #{projects.length} active projects."
projects.each do |project, index|
  project.add_funds(50)
  project[index] = Project.new("new proj")
  puts project
end

projects.each do |project, index|
  if project.funds_needed > 0
  {
    #I actually don't know the method call to use here
    projects[index] = nil
    project.push(Project.new("Project #{index}")
    projects[-1].to_s()
  }
end
