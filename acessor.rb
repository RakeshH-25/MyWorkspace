class Class
  
  def my_attr_accessor(*args)

    my_attr_reader(*args)
    my_attr_writer(*args)

  end

  def my_attr_reader(*args)

    args.each do |arg|
      
      self.class_eval("def #{arg};@#{arg};end")
                     
    end
  end

  def my_attr_writer(*args)

    args.each do |arg|
      
      self.class_eval("def #{arg}=(val);@#{arg}=val;end")  
                     
    end
  end
end

class Person
  my_attr_accessor :name, :age  
  # my_attr_writer :name, :age 
  # my_attr_reader :name, :age 
end

person = Person.new
person.name = "Rakesh"
person.age = 25
puts person.name
puts person.age