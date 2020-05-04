
def print_header    
    puts "The students of Villains Academy".center(40)
    puts "-------------".center(40)
end

def print_list(array2d)
    array2d.each { |student|
        puts "#{student[:name]}, (#{student[:cohort]} cohort)".center(40) }
end

def print_footer(list)
    puts "Overall we have #{list.count} students".center(40)
end

def input_students
    puts "Enter the name of students (one per line)"
    puts "To finish enter a black line"
    students = []
    name =gets.chomp
    while !name.empty?
        students << { :name => name, :cohort => :november}
        puts "We now have #{students.count} students"
        name = gets.chomp
    end
    students
end

students = input_students
print_header
print_list(students)
print_footer(students)