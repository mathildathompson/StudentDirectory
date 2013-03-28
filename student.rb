require 'rubygems'
require 'yaml'

class Person
  attr_accessor :name
  attr_accessor :email
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact

  def initialize
     self.get_person_info
  end

  def self.create_person(type)
    case type
    when "Student"
      Student.new
    when "Instructor"
      Instructor.new
    else
       nil
    end
  end

  def get_person_info
    print "What is your name? "
    self.name = gets.strip.chomp

    print "What is your email?"
    self.email = gets.strip.chomp

    print "What is your github_user?"
    self.github_user = gets.strip.chomp

    print "What is your twitter?"
    self.twitter = gets.strip.chomp

    print "What is your fun_fact?"
    self.fun_fact = gets.strip.chomp
  end
end 

class Student < Person
  attr_accessor :age
  attr_accessor :eyecolour

  def get_person_info
    super
    print "What is your age?"
    self.age = gets.strip.chomp

    print "What is your eyecolour"
    self.eyecolour = gets.strip.chomp
  end
end
   
class Instructor < Person
  attr_accessor :instructor_type

  def get_person_info
    super
    print "What type of instructor are you?"
    self.instructor = gets.strip.chomp
  end
end

@directory = ""
puts "Student Directory, v0.0.2 by Dan Garland & Mathilda"
print "Enter Student or Instructor, q to save and quit: "



while ((input = gets.strip.chomp) != 'q') do
  someone = Person.create_person(input)

  
  
  # Append this to our yaml file
  @directory += someone.to_yaml
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 
