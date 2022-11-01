require 'book'

describe Book do
  before :each do 
    @book = Book.new 'Title', 'Author', :category
  end 

  describe '#new' do 
    it 'returns a new book object' do 
      expect(@book).to be_an_instance_of(Book)
    end 

    it 'ArgumentError when passed < 3 arguments' do 
      expect{ Book.new 'Title', 'Author' }.to raise_error ArgumentError
    end
  end

  describe '#title' do 
    it 'returns the correct title' do 
      expect(@book.title).to eq('Title')
    end
  end

  describe '#category' do 
    it 'returns the correct category' do 
      expect(@book.category).to eq(:category)
    end
  end
end
