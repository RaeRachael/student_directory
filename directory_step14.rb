require 'csv'

@students = []

def print_header    
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_list_students
  @students.each { |student| puts "#{student[:name]}, (#{student[:cohort]} cohort)" }
end

def print_footer
  puts "Overall we have #{@students.count} students\n"
end

def input_students
  puts "Enter 'name, cohort' empty cohort will default to novemebr"
  puts "To finish enter a black line"
  loop do
    input = STDIN.gets.chomp
    break if input == ""
    name, cohort = input.split(", ")
    cohort ||= "november"
    add_to_students(name, cohort.to_sym)
    puts "We now have #{@students.count} students\n"
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
  filename_choice
  CSV.open(@filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      file << student_data
    end
  end
end

def load_data
  filename_choice
  return if file_exist_check == false
  read_data_from_file
  count_loaded_students_from
end

def read_data_from_file
  CSV.read(@filename).each do |line|
    add_to_students(line[0], line[1])
  end
end

def load_from_existing_file
  @filename = ARGV.first || "students.csv" 
  exit if file_exist_check == false
  read_data_from_file
  count_loaded_students_from
end
  
def count_loaded_students_from
  puts "loaded #{@students.count} from #{@filename}"
end

def add_to_students(name, cohort = :november)
  @students << { :name => name, :cohort => cohort.to_sym }
end

def filename_choice
  puts "enter filename, no filename entry will pick 'students.csv'"
  @filename = gets.chomp
  @filename = "students.csv" if @filename == ""
  @filename
end

def file_exist_check
  if !File.exist?(@filename)
    puts "#{@filename} does not exist,"
    return false
  end
end

load_from_existing_file

interactive_menu

