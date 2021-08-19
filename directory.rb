@students = [] # an empty array saved to an instance variable, accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do # while the name is not empty, repeat this code
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} student(s)"
    name = gets.chomp # get another name from the user
  end
end

def interactive_menu
  loop do 
    print_menu # print the menu and ask the user what to do
    process(gets.chomp) # read the input and save it to a variable / do what the user has asked
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1" # input the students
    input_students 
  when "2" # show the students
    show_students
  when "9" 
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header 
  print_students_list
  print_footer
end

def print_header
  puts "The students of Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu