def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chop
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter #{name}'s cohort"
    cohort = gets.chop.to_sym
    cohort = "Uknown" if cohort.empty? 
    students << {name: name, cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else 
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.chop
  end
  # return the array of students
  students
end

def print_header
  puts "The Students of Villains Academy".center(50, " * ")
  puts "-------------".center(50)
end

def print(students)
  students_by_cohort = {}
  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]
    if students_by_cohort[cohort] == nil
      students_by_cohort[cohort] = [name]
    else
      students_by_cohort[cohort].push(name)
    end
  end
    students_by_cohort.each do |cohort, name|
      puts "The following students are in the #{cohort} cohort: #{students_by_cohort[cohort]}"
    end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students # stating the argument for the methods
print_header
print(students)
print_footer(students)