require_relative 'project'
require_relative 'funding_round'

class Hedgefund
  attr_reader :co_name, :projects

  def initialize(name)
    @co_name = name
    @projects = []
    @die = Die.new()
  end

  def add_project(project)
    projects.push(project)
  end

  def status
    puts "There are #{projects.length} active projects."
    projects
  end

  def update
    @projects.each do |project|
      FundingRound.update(project)
    end
  end
end
