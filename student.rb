class Student
   attr_accessor :name ,:department,:roll_no
   @@no_of_student=0
   def initialize()
    @@no_of_student+=1
   end
   def self.no_of_student
     @@no_of_student
   end
   def display_info
        puts "displaying student info 
               1.Name:#{name}
               2.department: #{department}
               3.rol_no :#{}"
   end
end
student1=Student.new
student2=Student.new
puts "no_of_student: #{Student.no_of_student}"
student1.display_info