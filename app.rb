require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/employee")
require("./lib/division")
require("pg")

get('/') do
  @divisions = Division.all()
  erb(:index)
end

post('/divisions') do
  name = params.fetch('name')
  @division = Division.new({:name => name, :id => nil})
  @division.save()
  redirect ("/")
  erb(:index)
end

get("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:employees)
end


post('/employees') do
  name = params.fetch('name')
  division_id = params.fetch('division_id').to_i()
  @employee = Employee.new({:name => name, :division_id => division_id})
  @employee.save()
  @employees = Employee.all()
  @division = Division.find(division_id)
  erb(:employees)
end
