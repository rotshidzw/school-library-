class Rental
  attr_reader :date

  attr_writer :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book

    book.rentals << self

    @person = person

    person.rentals << self
  end

  def add_rentals(rental)
    @rental.push(rental)
  end
end
