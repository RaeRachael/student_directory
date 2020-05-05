
@students = []

def print_header    
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_list_students(array2d = @students)
  array2d.each { |student| puts "#{student[:name]}, (#{student[:cohort]} cohort)" }
end

def print_footer(list = @students)
  puts "Overall we have #{list.count} students\n"
end

def input_students
  puts "Enter the name of students (one per line)"
  puts "To finish enter a black line"
  name = STDIN.gets.chomp
  while !name.empty?
    push_to_array(name)
    puts "We now have #{@students.count} students\n"
    name = STDIN.gets.chomp
  end
end

def process(user_choice)
  case user_choice
  when 1.to_s
    input_students
  when 2.to_s
    output_students
  when 3.to_s
    save_data
    puts "data saved"
  when 4.to_s
    load_data
  when 9.to_s
    puts "program exiting"
    exit
  end
end

def interactive_menu
  loop do
    menu_options
    process(STDIN.gets.chomp)
  end
end

def menu_options
  list_of_options = ["1, input students",
                    "2, view students",
                    "3, save data",
                    "4, load saved data",
                    "9, exit"]
  puts list_of_options
end

def output_students
  print_header
  print_list_students
  print_footer
end

def save_data
  filename = filename_choice
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    file.puts student_data.join(",")
  end
  file.close
end

def load_data()
  filename = filename_choice
  file_exist_check(filename)
  read_data_from(filename)
  count_loaded_students_from(filename)
end

def read_data_from(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    push_to_array(name, cohort)
  end
  file.close
end

def load_from_existing_file
  filename = ARGV.first || "students.csv" 
  return if filename == nil
  file_exist_check(filename)
  read_data_from(filename)
  count_loaded_students_from(filename)
end
  
def count_loaded_students_from(filename)
  puts "loaded #{@students.count} from #{filename}"
end

def push_to_array(name, cohort = :november)
  @students << { :name => name, :cohort => cohort.to_sym }
end

def filename_choice
  puts "enter filename, no filename entry will pick 'students.csv'"
  filename = gets.chomp
  filename = "students.csv" if filename == ""
  file_exist_check(filename)
  filename
end

def file_exist_check(filename)
  if !File.exists?(filename)
    puts "#{filename} does not exist, exiting program"
    exit
  end
end

load_from_existing_file

interactive_menu

