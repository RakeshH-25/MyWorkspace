class CSVReader
  require 'csv' 
  def self.inherited(subclass)
    @@filename = subclass
    
    @@csv_data = CSV.read("./#{subclass}.csv", :headers => true).to_a
    
    @@csv_data[0].each do |attr|
    
      # Adds accessor method which are the column headings of the csv.
      self.class_eval("attr_accessor :#{attr}")
        #Adds class method of the form find_by_<column_name>(value).  
      self.class_eval("def self.find_by_#{attr}(val);e = get_find(val);end") 

    end   
       
  end

  def self.get_find(val)
    match = []
    @@csv_data.each do |row|
      if row.to_a.include?(val.to_s)
        obj = @@filename.new
          @@csv_data[0].each_with_index do |attr, index|
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