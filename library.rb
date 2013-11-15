class Library
  def initialize
    @books = []
    puts "You have created a new Library with no books yet."
  end

  def books

  end

  def list_books
  end

  def borrowed_books
  end

  def available_books
  end

  def add_book(book)
    #add book to the library
    puts ""
  end

  def check_out(user, book)
  end

  def check_in(book)
  end
end

class Borrower
  def initialize(name)
    @name = name
    puts "You have added a borroewer to the library named #{@name}"
  end

  def borrowed_books
    # empty array for books held by borroewer
  end

  def name
  end

  def borrowed_books_count
  end

  def borrowed_books_list
  end
end

class Book
  def initialize(title, author)
    @title = title
    @author = author
    puts "You have added a book to the library called #{title} by the author #{author}."
  end
end
