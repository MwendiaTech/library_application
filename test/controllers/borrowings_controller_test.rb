require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :users, :books, :borrowings

  test "should require login for borrowing" do
    post book_borrowings_path(books(:book_two))
    assert_redirected_to new_user_session_path
  end

  test "should create borrowing when logged in" do
    sign_in users(:two)
    assert_difference("Borrowing.count", 1) do
      post book_borrowings_path(books(:book_two))
    end
    assert_redirected_to books_path
    follow_redirect!
    assert_match "Book borrowed successfully", response.body
  end

  test "should return borrowed book" do
    sign_in users(:one)
    borrowing = borrowings(:borrowing_one)
    delete borrowing_path(borrowing)
    assert_redirected_to profile_path
    borrowing.reload
    assert_not_nil borrowing.returned_at
  end
end
