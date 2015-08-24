class CSVReader
  require 'csv' 
  def self.inherited(subclass)
    @@filename = subclass
    
    @@arr_of_emp = CSV.read("./#{subclass}.csv", :headers => true).to_a
    
    @@arr_of_emp[0].each do |attr|
    
      # Adds accessor method which are the column headings of the csv.
        self.class_eval("attr_accessor :#{attr}")
        #Adds class method of the form find_by_<column_name>(value).  
      self.class_eval("def self.find_by_#{attr}(val);e = emp_find(val);end") 

    end   
       
  end

  def self.emp_find(val)
    employee = []
    @@arr_of_emp.each do |row|
      if row.to_a.include?(val.to_s)
        emp = @@filename.new
          @@arr_of_emp[0].each_with_index do |attr, index|
            emp.instance_variable_set("@#{attr}", row[index])
          end
        employee << emp
      end
    end
    return employee
  end

  def method_missing(method_name,*args,&meth_bolck)
    puts "method #{method_name} missing"

  end
end

class Employee < CSVReader
end

emp=Employee.new
emp.name = "rak"
emp.age = 25
emp.department = "it"
p emp
puts

 p Employee.find_by_age(25)
 puts

 p Employee.find_by_name("Sowjanya")
 puts

 class Student < CSVReader
 end
 p Student.find_by_name("Rakesh")
 puts

 class Company < CSVReader
 end
 p Company.find_by_country("India")