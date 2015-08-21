class Employee

   attr_accessor :name, :age, :address

  def initialize(*args)
    @name = args[0]
    @age = args[1]
    @address = args[2] 
  end
   def <=>(per)
    @name <=> per.name
  end
end


 emp = [Employee.new("Rakesh", 25, "Bengaluru"), Employee.new("Raju", 24, "Bengaluru")]
 p emp.class , emp
puts
 p emp.sort