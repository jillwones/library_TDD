# frozen_string_literal: true

require 'yaml'

class Library
  attr_accessor :books

  def initialize(lib_file = false)
    @lib_file = lib_file
    @books = @lib_file ? YAML.load(File.read(@lib_file)) : []
  end

  # above => if passed an argument when instantiating Library then yaml will load argument (filename)
  # if no arg then nothing is loaded and @books = []

  def get_books_in_cat(category)
    @books.select do |book|
      book.category == category
    end
  end

  def add_book(book)
    @books << book
  end

  def get_book(book_title)
    @books.select { |book| book.title == book_title }.first
  end

  def save(lib_file = false)
    @lib_file = lib_file || @lib_file || 'library.yml'
    File.open @lib_file, 'w' do |f|
      f.write YAML.dump @books
    end
  end

  # above => if passed an argument when calling save method, it'll save to that file,
  # if no arg then it'll save to the @lib_file that was set when the class instance 
  # was made, and if there was no lib_file passed when the instance was made then
  # it'll save to library.yml
  
end
