require_relative 'project'
require_relative 'fund_manager'

alpha = Project.new("alpha", 10000, 100000)
beta = Project.new("beta")
gamma = Project.new("gamma", 400, 1200)

favorite_funding = Hedgefund.new("Favorite LLC")
=begin
favorite_funding.add_project(alpha)
favorite_funding.add_project(beta)
favorite_funding.add_project(gamma)
=end

favorite_funding.load_projects("projects.csv")
loop do
  puts "Please enter days of funding: ('e' to exit)"
  answer = gets.chomp

  case answer
  when /^\d+$/
    favorite_funding.update(answer.to_i)
  when /[e]/
    break
  else
    puts "Please enter a number or 'e' to exit."
  end
end

favorite_funding.projects.each_with_index do |project, index|
  if project.funds_needed > 0
    favorite_funding.projects.delete(project)
    favorite_funding.add_project(Project.new("Project #{index}"))
  end
end

favorite_funding.save_stats
