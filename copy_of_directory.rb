students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter #{name}'s cohort"
    cohort = gets.chomp.to_sym
    cohort = "Uknown" if cohort.empty? 
    students << {name: name, cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else 
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The Students of Villains Academy".center(50, " * ")
  puts "-------------".center(50)
end

# print method using while loop rather than .each method
def print(students)
  index = 0
  while index < students.length do
    puts "#{index+1}. #{students[index][:name]} (#{students[index][:cohort].capitalize} cohort)".center(50)
  index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students # stating the argument for the methods
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)