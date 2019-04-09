require_relative 'project'
require_relative 'die'
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
    projects.each do |project|
      @die.roll
      if @die.number % 2 == 0
        project.add_funds(100)
      else
        project.remove_funds(100)
      end

      if project.funds_needed <= 0
        puts project.name ' is fully funded!'
      end
    end
  end
end
