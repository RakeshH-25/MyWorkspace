class CSVReader
  require 'csv' 
  attr_accessor :file_name, :file_data
  
  

  def self.inherited(subclass)
    @file_name = subclass
    
    @file_data = CSV.read("./#{subclass}.csv", :headers => true).to_a
   
    subclass.instance_variable_set("@file_name", instance_variable_get(:@file_name))
    subclass.instance_variable_set("@file_data", instance_variable_get(:@file_data))

    @file_data[0].each do |attr|
    
      # Adds accessor method which are the column headings of the csv.
      self.class_eval("attr_accessor :#{attr}")
        #Adds class method of the form find_by_<column_name>(value).  
      self.class_eval("def self.find_by_#{attr}(val);e = get_find(val);end") 

    end   
       
  end

  def self.get_find(val)
    match = []

    @file_data.each do |row|
      if row.to_a.include?(val.to_s)
        
        obj = @file_name.new
          @file_data[0].each_with_index do |attr, index|
            obj.instance_variable_set("@#{attr}", row[index])
          end
        match << obj
      end
    end
    return match
  end

  def method_missing(method_name,*args,&meth_bolck)
    puts "method #{method_name} missing"

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
 p Employee.find_by_name("Sowjanya")
 puts


 p Student.find_by_name("Rakesh")
 puts


 p Company.find_by_country("India")