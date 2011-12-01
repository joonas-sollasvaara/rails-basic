require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  test "book listing" do
    get :index
    assert_response :success
    assert assigns(:books)
  end
  
end
