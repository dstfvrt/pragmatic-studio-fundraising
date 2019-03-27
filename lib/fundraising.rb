def date
  Time.new.strftime("%m/%d/%y")
end

def project_status(name, funding=1000)
  "Project: #{name}\tFunding: #{funding}\nLast updated on #{date}"
end

puts project_status("Alpha", 60)
puts project_status("Beta", 125)
puts project_status("Theta")
puts project_status("Gamma", 90)
