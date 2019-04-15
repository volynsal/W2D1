require_relative "employee.rb"

class Manager < Employee

    def initialize(name, title, salary, boss)
        @employees_assigned = []
        super(name, title, salary, boss)
    end
    
    def manager_bonus (multiplier)
        sum = 0
        
        @employees_assigned.each do |employee|
            sum += employee.salary
        end
        sum * multiplier
    end

    def add_employee(employee)
        @employees_assigned << employee
    end
end

David = Employee.new("David","TA",10000,"Darren")
Shawna = Employee.new("Shawna","TA",12000,"Darren")
Darren = Manager.new("Darren","TA Manager",78000,"Ned")
Ned = Manager.new("Ned","TA Manager",1000000,nil)

Ned.add_employee(Shawna)
Ned.add_employee(David)
Ned.add_employee(Darren)

#puts David.bonus(3)
puts Ned.manager_bonus(5)