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
  
end
