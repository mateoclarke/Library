class Library
  def initialize
    @books = []
    puts "You have created a new Library with no books yet."
  end

  def list_books
    @books.each {|book| puts "'#{book.title}' is #{book.status}." }
  end

  def borrowed_books
    @books.each do |book|
      if book.status == "checked out" 
        puts "'#{book.title}' is checked out to #{book.borrower.name}" 
      end
    end
  end

  def available_books
    @books.each do |book|
      if book.status != "checked out"
        puts "'#{book.title}' is currently available"
      end
    end
  end

  def add_book(book)
    #add book to the library
    @books.push(book)
    puts "You've added '#{book.title}' to the Library."
    puts "You know have " + @books.length.to_s + " books in the Library."
  end

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

class Borrower
  def initialize(name)
    @name = name
    @borrowed_books = []
    puts "You have added a borrower to the library named #{@name}"
  end

  def borrowed_books
    # empty array for books held by borrower
    @borrowed_books
  end

  attr_accessor :name

  def borrowed_books_count
    @borrowed_books.length
  end

  def borrowed_books_list
    @borrowed_books.each {|book| puts "'#{book.title}' by #{book.author}" }
  end
end

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
    puts "You have purchased/printed a new book called '#{title}' by the author #{author}."
  end

  attr_accessor :title, :author, :status, :borrower

end
