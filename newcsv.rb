class CSVReader
  require 'csv' 

  def self.inherited(subclass)
    CSV.read("./#{subclass}.csv", :headers => true).headers.each do |attr|
      subclass.instance_eval("def self.find_by_#{attr}(valu);@col_name = \"#{attr}\";objects_with(valu.to_s,@col_name);end")
      subclass.instance_eval("attr_accessor :#{attr}")
    end 
  end

  def self.objects_with(valu,col_name)
    matching_objects = []
    content = CSV.read("./#{self}.csv", :headers => true)
    content.each do |row|
      if row[col_name] == valu.to_s
        new_obj = self.new
        content.headers.each_with_index do |attr, index|
          new_obj.instance_variable_set("@#{attr}", row[index])
        end
        matching_objects << new_obj
      end
    end
    matching_objects
  end
end

class Employee < CSVReader
end

class Student < CSVReader
end

class Company < CSVReader
end

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