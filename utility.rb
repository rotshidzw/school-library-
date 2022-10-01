module Utility
  def proper_age
    print 'Age: '
    age = gets.chomp

    loop do
      return age if age.to_i.to_s == age

      print "Please Add a proper age!!\nAge: "
      age = gets.chomp
    end
  end

  def check_book_availability
    selected_book = gets.chomp

    loop do
      if selected_book.to_i.to_s != selected_book
        puts "\n>>>> Please insert a number <<<<\n\n"
        print '[Book #]: '
        selected_book = gets.chomp
      elsif selected_book.to_i.negative? || selected_book.to_i >= @book.length
        puts "\n>>>> Please insert a valid number <<<<\n\n"
        print '[Book #]: '
        selected_book = gets.chomp
      else
        return selected_book
      end
    end
  end

  def check_person_availability
    selected_person = gets.chomp

    loop do
      if selected_person.to_i.to_s != selected_person
        puts "\n>>>> Please insert a number <<<<\n\n"
        print '[Person #]: '
        selected_person = gets.chomp
      elsif selected_person.to_i.negative? || selected_person.to_i >= @student.length + @teacher.length
        puts "\n>>>> Please insert a valid number <<<<\n\n"
        print '[Person #]: '
        selected_person = gets.chomp
      else
        return selected_person
      end
    end
  end

  def rental_book_menu
    @book.each_with_index do |b, i|
      puts "#{i}) Title: #{b.title}\t\tAuthor: #{b.author}"
    end
  end

  def rental_person_menu(person)
    si = @student.length
    return if person.empty?

    person.each_with_index do |p, i|
      if i < si
        puts "#{i}) [Student] Name: #{p.name}\t\tID: #{p.id}\t\tAge: #{p.age}"
      else
        puts "#{i}) [Teacher] Name: #{p.name}\t\tID: #{p.id}\t\tAge: #{p.age}"
      end
    end
  end
end
