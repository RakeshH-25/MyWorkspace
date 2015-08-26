class CSVReader
  require 'csv' 
  
  def self.inherited(subclass)
    @file_name = subclass 
    @file_data = CSV.read("./#{subclass}.csv", :headers => true).to_a
    
    subclass.instance_variable_set("@file_name", instance_variable_get(:@file_name))
    subclass.instance_variable_set("@file_data", instance_variable_get(:@file_data))
    
    @file_data[0].each do |attr|
      subclass.instance_eval("def self.find_by_#{attr}(val);@col = \"#{attr}\";e = get_find(val.to_s,@col);end")
      subclass.instance_eval("attr_accessor :#{attr}")
    end  

  end

  def self.get_find(val,col)
    
    match = []
    fcol = ""
    @file_data[0].each do |name|
      fcol = @file_data[0].index(name) if name == col
    end
    
    @file_data.each do |row|
      if row[fcol.to_i] == val
        
        obj = @file_name.new
          @file_data[0].each_with_index do |attr, index|
            obj.instance_variable_set("@#{attr}", row[index])
          end
        match << obj
      end
    end
    return match
  end

end

class Employee < CSVReader
end

class Student < CSVReader
end

class Company < CSVReader
end

  # p Employee.methods
  # p Student.methods 

 # p CSVReader.instance_variables
 # p Employee.instance_variables

  emp=Employee.new
  emp.name = "rak"
  emp.age = 25
  emp.department = "it"
  p emp
  puts

 p Employee.find_by_age(25)
 puts
 p Student.find_by_name("Rakesh")
 puts
 p Company.find_by_country("India")