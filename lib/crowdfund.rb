require_relative 'project'
require_relative 'fund_manager'

alpha = Project.new("alpha", 10000, 100000)
beta = Project.new("beta")
gamma = Project.new("gamma", 400, 1200)

favorite_funding = Hedgefund.new("Favorite LLC")
favorite_funding.add_project(alpha)
favorite_funding.add_project(beta)
favorite_funding.add_project(gamma)

favorite_funding.status;

favorite_funding.projects.each_with_index do |project, index|
  if project.funds_needed > 0
    favorite_funding.projects.delete(project)
    favorite_funding.add_project(Project.new("Project #{index}"))
  end
end

puts favorite_funding.status
