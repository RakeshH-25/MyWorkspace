class CSVReader
  require 'csv' 

  def self.inherited(subclass)
    load_content(subclass)
    @col_headers.each do |attr|
      subclass.instance_eval("def self.find_by_#{attr}(valu);@col_name = \"#{attr}\";e = objects_with(valu.to_s,@col_name);end")
      subclass.instance_eval("attr_accessor :#{attr}")
    end  
  end

  def self.load_content(filename)
    @file_data   = CSV.read("./#{filename}.csv", :headers => true).to_a
    @col_headers = @file_data[0] 
  end

  def self.objects_with(valu,col_name)
    match = []
    load_content(self)
    @file_data.each do |row|
      if row[@col_headers.index(col_name)] == valu
        new_obj = self.new
        @col_headers.each_with_index do |attr, index|
          new_obj.instance_variable_set("@#{attr}", row[index])
        end
        match << new_obj
      end
    end
    match
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