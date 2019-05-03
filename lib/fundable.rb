
module Fundable
  def add_funds(amount)
    self.funding += amount
    puts "Project #{name} added funds!"
  end

  def remove_funds(amount)
    self.funding -= amount
    puts "Project #{name} lost funds!"
  end

  def funds_needed
    funding_target - funding
  end
end
