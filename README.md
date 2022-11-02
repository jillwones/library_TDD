# library_TDD
## Description
RSpec, TDD, Red + Green + Refactor - first built up the Book class to satisfy tests, then built up the Library class, again, to satisfy all tests.
Exercise from: [Ruby for Newbies](https://www.youtube.com/watch?v=JhR9Ib1Ylb8) - video is 11 years old so some of the syntax in my code differs from the syntax used in the video, e.g.
```ruby
# Old syntax:
@book.should be_an_instance_of Book

# New syntax:
expect(@book).to be_an_instance_of Book
```
## How to run
If RSpec is not installed:
```sh
gem install rspec
```
Run tests:
```sh
rspec
```
