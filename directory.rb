
students = [{:name => "Dr. Hannibal Lecter", :cohort => :november},
    {:name => "Darth Vader", :cohort => :november},
    {:nmae => "Nurse Ratched", :cohort => :november},
    {:name => "Michael Corleone", :cohort => :november},
    {:name => "Alex DeLarge", :cohort =>  :november},
    {:nmae => "The Wicked Witch of the West", :cohort => :november},
    {:name => "Terminator", :cohort => :november},
    {:name => "Freddy Krueger", :cohort => :november},
    {:name => "The Joker", :cohort => :november},
    {:name => "Joffrey Baratheon", :cohort => :november},
    {:name => "Norman Bates", :cohort => :november}]

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

print_header
print_list(students)
print_footer(students)