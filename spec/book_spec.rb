require 'book'

describe Book do
  before :each do 
    @book = Book.new 'Title', 'Author', :category
  end 

  describe "#new" do 
    it "returns a new book object" do 
      expect(@book).to be_an_instance_of(Book)
    end 

    it "ArgumentError when passed < 3 arguments" do 
      expect{ Book.new "Title", "Author" }.to raise_error ArgumentError
    end
  end
end
