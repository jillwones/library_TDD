require 'library'
require 'book'

describe 'Library Object' do
  before :all do
    lib_array = [
      Book.new('JavaScript: The Good Parts', 'Douglas Crockford', :development),
      Book.new('Designing with Web Standards', 'Jeffrey Zeldman', :design),
      Book.new("Don't Make me Think", 'Steve Krug', :usability),
      Book.new('JavaScript Patterns', 'Stoyan Stefanov', :development),
      Book.new('Responsive Web Design', 'Ethan Marcotte', :design)
    ]
    # above => before :all runs the block one time before all the tests

    File.open 'books.yml', 'w' do |f|
      f.write YAML.dump lib_array
    
    # above => before all the below tests run, the lib_array is saved to a yml file,
    # books.yml
    end
  end

  before :each do
    @lib = Library.new('books.yml')
  end

  # above => before :each runs the block one time per test, so for each test an instance
  # of the Library class is made with the books from the books.yml file

  describe '#new' do
    context 'with no parameters' do
      it 'should have no books' do
        lib = Library.new
        expect(lib.books.length).to eq(0)
      end
    end

    context 'with a yaml file name parameter' do
      it 'has five books' do
        expect(@lib.books.length).to eq(5)
      end
    end
  end

  it 'returns all the books in a given category' do
    expect(@lib.get_books_in_cat(:development).length).to eq(2)
  end

  it 'accepts new books' do
    new_book = Book.new('NewOne', 'Someone', :comedy)
    expect(@lib.add_book(new_book).last).to eq(new_book)
  end

  it 'retrieves books based on inputted title' do
    expect(@lib.get_book('Responsive Web Design')).to be_an_instance_of Book
  end

  it 'saves the library' do
    books = @lib.books.map { |book| book.title } # rubocop recommended changing the block here to {&:title}
    @lib.save 'our_new_library.yml'
    lib2 = Library.new 'books.yml'
    books2 = lib2.books.map { |book| book.title }
    expect(books).to eq(books2)
  end
end
