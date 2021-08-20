@students = [] 

def print_menu
  puts "Enter 1 to Input the students"
  puts "Enter 2 to Show the students"
  puts "Enter 3 to Save the list to file"
  puts "Enter 4 to Load the list from file"
  puts "Enter 5 to Exit"
end

def interactive_menu
  loop do 
    print_menu 
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1" then input_students 
  when "2" then show_students
  when "3" then save_students 
  when "4" then load_students 
  when "5" then exit 
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  name = STDIN.gets.chomp
  cohort = "november"
  while !name.empty? do 
    collect_students_in_array(name, cohort)
    puts "Now we have #{@students.count} student(s)"
    name = STDIN.gets.chomp 
  end
end

def show_students
  print_header 
  print_students_list
  print_footer
end

def print_header
  puts "The students of Makers Academy\n-------------"
end

def print_students_list
  @students.each { |student| puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "What file should this be saved to?"
  filename = STDIN.gets.chomp
  if filename.empty?
    filename = "students.csv"
  end
  file = File.open(filename, "w") # open the file for writing (w = write in file)
  @students.each do |student|
    student_data = [student[:name], student[:cohort]] 
    csv_line = student_data.join(",") 
    file.puts csv_line
  end
  file.close
  puts "Students saved to file"
end

def load_students(filename = "students.csv") # method now reads the filename as an argument with a default value
  puts "What file should this be loaded from?"
  filename = STDIN.gets.chomp
  file = File.open(filename, "r") # r = read only
  file.readlines.each do |line| 
    name, cohort = line.chomp.split(",") 
    collect_students_in_array(name, cohort)
  end
  file.close
  puts "Students loaded to file"
end

def collect_students_in_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  filename = "students.csv" if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if file does exist
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end
end

try_load_students
interactive_menu