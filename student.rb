require 'rubygems'
require 'yaml'

class People
  attr_accessor :name
  attr_accessor :email
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact

def self.questions
  person = People.new
  print "What is your name? "
  person.name = gets.strip.chomp

  print "What is your email?"
  person.email = gets.strip.chomp

  print "What is your github_user?"
  person.github_user = gets.strip.chomp

  print "What is your twitter?"
  person.twitter = gets.strip.chomp

  print "What is your fun_fact?"
  person.fun_fact = gets.strip.chomp

 return person 
end

end

class Student < People
  attr_accessor :reason_for_joining
  attr_accessor :age
  attr_accessor :eyecolour

end

class Instructor < People
  attr_accessor :type
end

@directory = ""
puts "Student Directory, v0.0.1 by Dan Garland"
print "Enter Student or Instructor, q to save and quit: "



while ((input = gets.strip.chomp) != 'q') do

  person = People.questions
  case input
  when 'Student' 
    # person = Student.new
    # print "What is your name? "
    # person.name = gets.strip.chomp
    # print "What is your email? "
    # person.email = gets.strip.chomp 
    
  when 'Instructor'
    # person = Instructor.new
    # print "What is your name? "
    # person.name = gets.strip.chomp
    # print "What is your email? "
    # person.email = gets.strip.chomp
    # print "What sort of instructor are you? "
    # person.type = gets.strip.chomp
  end
  
  # Append this to our yaml file
  @directory += person.to_yaml
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 
