# A Class containing actions and function that a Library can use to 
# list inventory, check out books, etc.
class Library

  # Initializes a Library with an empty Array of books
  def initialize
    @books = []
    puts "You have created a new Library with no books yet."
  end

  # Lists books and their status
  def list_books
    @books.each {|book| puts "'#{book.title}' is #{book.status}." }
  end

  # Lists all books with a status of "checked out"
  def borrowed_books
    @books.each do |book|
      if book.status == "checked out" 
        puts "'#{book.title}' is checked out to #{book.borrower.name}" 
      end
    end
  end

  # Lists all books with a status not equal to "checked out"
  def available_books
    @books.each do |book|
      if book.status != "checked out"
        puts "'#{book.title}' is currently available"
      end
    end
  end

  # Adds a book to the Library
  # 
  # book is the argument from the class Book with these attributes:
  # 
  # - title 
  # - author
  # - status (default = "available")
  # - borrower (default = nil)
  def add_book(book)
    @books.push(book)
    puts "You've added '#{book.title}' to the Library."
    puts "You know have " + @books.length.to_s + " books in the Library."
  end

  # Changes the status of a book from available (the default) to "checked out"
  # Moves the book from the library's available_books array to the borrower's borrowed_books array
  # Prohbits user from taking more than 2 books
  # 
  # Arugemts: user, book
  # 
  # user is an argument for book in the Book class.
  # book is an object of the Book class.
  def check_out(user, book)
    if user.borrowed_books.length == 2
      puts "Sorry #{user.name}, you have already checked out two books."
      return 
    end

    if book.status == "available"
      book.borrower = user
      user.borrowed_books.push(book)
      book.status = "checked out"
      puts "#{user.name} checked out '#{book.title}' by #{book.author}."
    elsif book.status == "checked out"
      puts "Sorry '#{book.title}' is checked out by another library member."
    else
      puts "Sorry, that book is not available"
      return 
    end
  end

  # Moves the given book from the borrower's borrowered_books array back to the Library's available_books array
  # Changes the book status back to default
  def check_in(book)
    if book.status == "checked out"
    puts "'#{book.title}' has been checked back in by #{book.borrower.name}"   
    book.status = "available"
    book.borrower.borrowed_books.delete(book)
    else
      puts "'#{book.title}' is already checked in."
    end
  end
end

# A class containing members of the library and arrays related to the books they have
class Borrower

  # Initializes an instance of Borrower with a given name and and empty array of books borrowed
  def initialize(name)
    @name = name
    @borrowed_books = []
    puts "You have added a borrower to the library named #{@name}"
  end

  # Gets/Sets the Borrower's name and array list of Books currently held.
  attr_accessor :name, :borrowed_books

  # Gives the number of books held by the borrower in order to limit simultaneous withdraws to 2 books.
  def borrowed_books_count
    @borrowed_books.length
  end

  # lists out books held by borrower
  def borrowed_books_list
    @borrowed_books.each {|book| puts "'#{book.title}' by #{book.author}" }
  end
end

# A Class containing information specific to each book
class Book

  # Initializes a new book to the Book class with given title, author, status, and borrower
  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
    puts "You have purchased/printed a new book called '#{title}' by the author #{author}."
  end

  # Gets/Sets the book's title, author, status, and borrower.
  attr_accessor :title, :author, :status, :borrower

end
