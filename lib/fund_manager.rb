require_relative 'project'
require_relative 'funding_round'
require 'pry'
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
      binding.pry
      under_funded.sort_by { |a, b| a.funds_needed <=> b.funds_needed}
      puts "Projects in need of contributions:"
      under_funded.each do |p|
        puts "#{p.name}, #{p.funding} out of #{p.funding_target}"
      end
    end
  end
end
