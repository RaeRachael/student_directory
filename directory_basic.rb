
@students = []

def print_header    
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_list(array2d = @students)
  array2d.each { |student| puts "#{student[:name]}, (#{student[:cohort]} cohort)" }
end

def print_footer(list = @students)
  puts "Overall we have #{list.count} students\n"
end

def input_students
  puts "Enter the name of students (one per line)"
  puts "To finish enter a black line"
  name =gets.chomp
  while !name.empty?
    @students << { :name => name, :cohort => :november}
    puts "We now have #{@students.count} students\n"
    name = gets.chomp
  end
end

def process(user_choice)
  case user_choice
  when 1.to_s
    input_students
  when 2.to_s
    output_students
  when 9.to_s
    exit
  end
end

def interactive_menu
  loop do
    menu_options
    process(gets.chomp)
  end
end

def menu_options
  list_of_options = ["1, input students", "2, view students", "9, exit"]
  puts list_of_options
end

def output_students
  print_header
  print_list_students
  print_footer
end 
  
interactive_menu

