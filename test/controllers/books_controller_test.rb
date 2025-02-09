require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :users, :books

  test "should get index" do
    get books_path
    assert_response :success
    assert_select "h1", "Books"
  end

  test "should show book" do
    get book_path(books(:book_one))
    assert_response :success
    assert_select "h1", books(:book_one).title
  end

  test "should get new when logged in" do
    sign_in users(:one)
    get new_book_path
    assert_response :success
  end

  test "should redirect new when not logged in" do
    get new_book_path
    assert_redirected_to new_user_session_path
  end

  test "should create book when logged in" do
    sign_in users(:one)
    assert_difference("Book.count", 1) do
      post books_path, params: { book: { title: "New Book", author: "New Author", isbn: "uniqueisbn123" } }
    end
    assert_redirected_to book_path(Book.last)
    follow_redirect!
    assert_match "New book created successfully", response.body
  end
end
