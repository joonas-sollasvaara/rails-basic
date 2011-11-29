require 'test_helper'

class BookTest < ActiveSupport::TestCase
  
  setup do
    @book     = books(:one)
    @new_book = Book.new(@book.attributes.merge({:title => 'New'}))
  end

  test "should save valid book" do
    assert @new_book.valid?
    assert @new_book.save
  end
  
  test "should not save book without a title" do
    @new_book.title = ''
    assert @new_book.invalid?
    assert @new_book.errors[:title].any?
    assert !@new_book.save, "Saved the book without a title"
  end
  
  test "should not save book with duplicate title" do
    @new_book.title = @book.title
    assert @new_book.invalid?
    assert_match /has already been taken/, @new_book.errors[:title].join
    assert !@new_book.save
  end
  
  test "should not save book without authors" do
    @new_book.authors = ''
    assert @new_book.invalid?
    assert @new_book.errors[:authors].any?
    assert !@new_book.save
  end
  
  test "should not save book with invalid ISBN" do
    @new_book.isbn = '123456789a'
    assert @new_book.invalid?
    assert_match /is not a valid ISBN/, @new_book.errors[:isbn].join
    assert !@new_book.save
  end
  
end
