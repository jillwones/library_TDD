require 'library'
require 'book'

describe "Library Object" do 

  before :all do 
    lib_array = [
      Book.new('JavaScript: The Good Parts', 'Douglas Crockford', :development),
      Book.new('Designing with Web Standards', 'Jeffrey Zeldman', :design),
      Book.new("Don't Make me Think", 'Steve Krug', :usability),
      Book.new('JavaScript Patterns', 'Stoyan Stefanov', :development),
      Book.new('Responsive Web Design', 'Ethan Marcotte', :design)
    ]

    File.open "books.yml", "w" do |f|
      f.write YAML.dump lib_array 
    end
  end 

  before :each do 
    @lib = Library.new('books.yml')
  end 

  describe '#new' do 
    context "with no parameters" do 
      it "should have no books" do 
        lib = Library.new
        expect(lib.books.length).to eq(0)
      end 
    end 

    context "with a yaml file name parameter" do 
      it "has five books" do 
        expect(@lib.books.length).to eq(5)
      end 
    end
  end
end