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

  def update(days)

    1.upto(days) do |d|
      puts "Day #{d}:"
      @projects.each do |project|
        FundingRound.update(project)
      end
    end

    under_funded, fully_funded = projects.partition { |p| p.funds_needed >= 0}

    if fully_funded.size == 0
      puts "No projects are fully funded."
    else
      puts "Fundraising completed.\nFully funded projects:"
      fully_funded.each do |p|
        puts "#{p.name}, #{p.funding} out of #{p.funding_target}"
      end
    end

    if under_funded.size == 0
      puts "No projects are in need of further contributions."
    else
      under_funded.sort_by do |first, second|
        return first unless second
        first <=> second
      end

      puts "Projects in need of contributions:"
      under_funded.each do |p|
        puts "#{p.name}, #{p.funding} out of #{p.funding_target}"
      end
    end

    puts "All pledges:"
    projects.each do |p|
      puts "#{p.name} pledges:"
      p.each_pledge do |pledge|
        puts "$#{pledge.amount} in #{pledge.name} pledges"
      end
    end
  end
end
