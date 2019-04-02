require_relative 'project'
class Hedgefund
  attr_reader :co_name, :projects

  def initialize(name)
    @co_name = name
    @projects = []
  end

  def add_project(project)
    projects.push(project)
  end

  def status
    puts "There are #{projects.length} active projects."
    projects
  end
end
