class CSVReader
  require 'csv' 

  attr_accessor :arr_of_emp

  def self.inherited(subclass)
    #puts "New subclass: #{subclass}"
    @@arr_of_emp = CSV.read("./#{subclass}.csv")
        
  end
end

class Employee < CSVReader
  
  attr_accessor :name, :age, :department
  
  def self.find_by_name(emp_name)
    found = false

    @@arr_of_emp.each do |emp| 
      
      found = true if emp[0] == emp_name
      
      if found
        e = Employee.new
        e.name = emp[0]
        e.age  = emp[1]
        e.department = emp[2]
        p e
        found = false
      end
    end
       
  end

  def self.find_by_age(emp_age)
    found = false

    @@arr_of_emp.each do |emp| 
      
      found = true if emp[1] == emp_age.to_s
      
      if found
        e = Employee.new
        e.name = emp[0]
        e.age  = emp[1]
        e.department = emp[2]
        p e
        found = false
      end
    end
  end

end

emp = Employee.new
emp.name = "Rakesh"
emp.age = 25
emp.department = "it"

Employee.find_by_name("Rakesh")
Employee.find_by_age(24)