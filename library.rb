class Library
  def initialize
    @books = []
    puts "You have created a new Library with no books yet."
  end

  def list_books
    puts "What books do we have in the library you ask?"
    @books.each {|book| puts book.title }
  end

  def borrowed_books
  end

  def available_books
  end

  def add_book(book)
    #add book to the library
    @books.push(book)
    puts "You've added " + book.title + " to the Library."
    puts "You know have " + @books.length.to_s + " books in the Library."
  end

  def check_out(user, book)
  end

  def check_in(book)
  end
end

class Borrower
  def initialize(name)
    @name = name
    puts "You have added a borrower to the library named #{@name}"
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
    puts "You have purchased/printed a new book called #{title} by the author #{author}."
  end

  def title
    @title
  end

  def author
    @author
  end
end
