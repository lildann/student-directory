@students = [] # an empty array saved to an instance variable, accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Exit"
end

def interactive_menu
  loop do 
    print_menu # print the menu and ask the user what to do
    process(STDIN.gets.chomp) # read the input and save it to a variable / do what the user has asked
  end
end

def process(selection)
  case selection
  when "1" then input_students 
  when "2" then show_students
  when "3" then save_students 
  when "4" then load_students 
  when "5" then exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do # while the name is not empty, repeat this code
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} student(s)"
    name = STDIN.gets.chomp # get another name from the user
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
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w") # w = write in file
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]] 
    csv_line = student_data.join(",") # csv = comma-separated variable
    file.puts csv_line
  end
  file.close
  puts "Students saved to file"
end

def load_students(filename= "students.csv") # method now reads the filename as an argument with a default value
  file = File.open(filename, "r") # r = read only
  file.readlines.each do |line| 
    name, cohort = line.chomp.split(",") # parallel assignment of an array (from .split method on a string)
    # chomp here discards the trailing new line character from the line
    @students << {name: name, cohort: cohort.to_sym} # cohort from string .to_sym for consistency
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if file does exist
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if file doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quits the program
  end
end

try_load_students
interactive_menu