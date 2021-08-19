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
    puts "Please enter the height of #{name} in cm"
    height = gets.chomp
    students << {name: name, cohort: :november, height: height }
    puts "Now we have #{students.count} student(s)"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# def print(students)
#   search_by_initial = "f"
#   students.each_with_index do |student, index|
#     if student[:name].chr == search_by_initial.upcase && student[:name].length < 12
#       puts "#{index+1}. #{student[:name]} is #{student[:height]} tall (#{student[:cohort].capitalize} cohort)"
#     end
#   end
# end

def print(students)
  search_by_initial = "f"
  index = 0
  while index < students.length do
    if students[index][:name].chr == search_by_initial.upcase && students[index][:name].length < 12
      puts "#{index+1}. #{students[index][:name]} is #{students[index][:height]} tall (#{students[index][:cohort].capitalize} cohort)"
    end
  index += 1
  end
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students # stating the argument for the methods
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)