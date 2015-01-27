require("spec_helper")


describe(Division) do
  it("tells which employees are in this division") do
    division = Division.create({:name => "Sales"})
    employee1 = Employee.create({:name => "Tyler", :division => division})
    employee2 = Employee.create({:name => "Dale", :division => division})
   expect(division.employees()).to(eq([employee1, employee2]))
  end
end
