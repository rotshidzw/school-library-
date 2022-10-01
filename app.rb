require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'utility'

class App
  attr_reader :teacher, :student, :book, :rentals

  include Utility

  def initialize
    @teacher = []
    @student = []
    @book = []
    @rentals = []
  end

  def menu
    puts
    45.times { print '=' }
    puts "\nPlease choose an option by entering a number:"
    45.times { print '-' }
    puts "\n"
    print "1. List all books\n2. List all people\n3. Create a person\n4. Create a book\n"
    print "5. Create a rental\n6. List all rentals for a given person id\n7. Exit\n"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @book << Book.new(title, author)
    puts "\n> Book crated successfully\n\n"
  end

  def display_book
    return if @book.empty?

    puts
    @book.each { |b| puts "Title: #{b.title}\t\tAuthor: #{b.author}" }
    puts
  end

  def create_person_object(person_type)
    age = proper_age
    print 'Name: '
    name = gets.chomp

    if person_type == '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase
      permission = permission != 'n'
      print 'Classroom: '
      classroom = gets.chomp
      @student << Student.new(age, classroom, permission, name)
    else
      print 'Specialization: '
      specialization = gets.chomp
      @teacher << Teacher.new(age, specialization, true, name)
    end
    puts "\n> Person crated successfully\n\n"
  end

  def create_person
    print 'Do you want to crate a student (1) or a teacher (2)? [Input the number]: '
    select_person = gets.chomp
    if select_person != '1' && select_person != '2'
      puts "\n>>>> Please insert [1] or [2] <<<<\n\n"
      return
    end
    create_person_object(select_person)
  end

  def display_person(person)
    type = '[Student]'
    type = '[Teacher]' unless person == @student

    return if person.empty?

    person.each { |p| puts "#{type} Name: #{p.name}\t\tID: #{p.id}\t\tAge: #{p.age}" }
  end

  def create_rental
    person = []
    person.concat(@student).concat(@teacher)
    return if @book.empty? || person.empty?

    puts 'Select a book from the following list by number'
    rental_book_menu
    selected_book = check_book_availability.to_i

    puts 'Select a person from the following list by number (not id)'
    rental_person_menu(person)
    selected_person = check_person_availability.to_i

    print "\nDate: "
    date = gets.chomp
    @rentals << Rental.new(date, @book[selected_book], person[selected_person])
    puts "\n> Rental crated successfully\n\n"
  end

  def display_rental
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rent|
      next if rent.person.id != id

      puts "Date: #{rent.date}, Book \"#{rent.book.title}\" by #{rent.book.author}"
    end
  end

  def sub_menu(input)
    case input
    when '1'
      display_book
    when '2'
      puts
      display_person(@student)
      display_person(@teacher)
      puts
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      display_rental
    end
  end

  def actions
    print "\n[Menu] > "
    user_input = gets.chomp
    sub_menu(user_input)
    'Exit' if user_input == '7'
  end

  def run
    user_input = ''
    puts "\nWelcome to School library APP!"

    while user_input != 'Exit'
      menu
      user_input = actions
    end
    puts "\nThank you for using this app!"
  end
end
