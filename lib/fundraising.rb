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

class Hedgefund
  attr_reader :co_name, :projects

  def initialize(name)
    @co_name = name
    @projects = []
  end

  def add_project(project)
    @projects.push(project)
  end

  def status
    puts "There are #{@projects.length} active projects."
    @projects.each do |project, index|
      puts project
    end
  end
end

alpha = Project.new("alpha", 10000, 100000)
beta = Project.new("beta")
gamma = Project.new("gamma", 400, 1200)

favorite_funding = Hedgefund.new("Favorite LLC")
favorite_funding.add_project(alpha)
favorite_funding.add_project(beta)
favorite_funding.add_project(gamma)

favorite_funding.status;

favorite_funding.projects.each do |project, index|
  if project.funds_needed > 0
    df-objects-interacting
    favorite_funding.projects.delete(project)
    favorite_funding.add_project(Project.new("Project #{index}"))
  end
end

puts favorite_funding.projects
puts '----------------'
puts favorite_funding.status
