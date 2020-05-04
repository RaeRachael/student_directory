
students = ["Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"]

def print_header    
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_list(list)
    puts list
end

def print_footer(list)
    puts "Overall we have #{list.count} students"
end 

print_header
print_list(students)
print_footer(students)