require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  test "book listing" do
    get :index
    assert_response :success
    assert assigns(:books)
  end
  
  test "show book" do
    book = books(:one)
    get :show, id: book.id
    assert_response :success
    assert assigns(:book)
    assert_equal book, assigns(:book)
  end
  
end
