
def print_header    
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_list(array2d)
  array2d.each { |student| puts "#{student[:name]}, (#{student[:cohort]} cohort)" }
end

def print_footer(list)
  puts "Overall we have #{list.count} students"
end

def input_students
  puts "Enter the name of students (one per line)"
  puts "To finish enter a black line"
  students = []
  name =gets.chomp
  while !name.empty?
    students << { :name => name, :cohort => :november}
    puts "We now have #{students.count} students\n"
    name = gets.chomp
  end
  students
end

def interactive_menu
  students = [] 
  loop do
    list_of_options= ["1, input students", "2, view students", "9, exit"]
    puts list_of_options
    case gets.chomp
    when 1.to_s
      students = input_students
    when 2.to_s
      print_header
      print_list(students)
      print_footer(students)
    when 9.to_s
      break
    end
  end
end
    
interactive_menu

