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

  test "new book" do
    get :new
    assert_response :success
    assert assigns(:book)
    assert assigns(:book).new_record?
  end
  
  test "create book with valid parameters" do
    assert_difference("Book.count", +1) do
      post :create, book: {title: 'Programming Your Home', authors: 'Mike Riley', isbn: '978-1-93435-690-6'}
      assert_response :redirect
      assert_redirected_to books_path
      assert flash[:notice]
    end
  end
  
  test "create book with invalid parameters" do
    post :create, book: {title: 'No such book'}
    assert_response :success
    assert assigns(:book)
    assert assigns(:book).new_record?
    assert_template :new
  end
  
end
