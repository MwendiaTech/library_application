require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  fixtures :users, :books, :borrowings

  test "borrowing should be valid" do
    borrowing = borrowings(:borrowing_one)
    assert borrowing.valid?
  end

  test "borrowed_at should be present" do
    borrowing = borrowings(:borrowing_one)
    borrowing.borrowed_at = nil
    assert_not borrowing.valid?
  end

  test "due_date should be present" do
    borrowing = borrowings(:borrowing_one)
    borrowing.due_date = nil
    assert_not borrowing.valid?
  end

  test "cannot borrow a book that is already borrowed" do
    existing_borrowing = borrowings(:borrowing_one)
    new_borrowing = Borrowing.new(
      user: users(:two),
      book: existing_borrowing.book,
      borrowed_at: Time.current,
      due_date: 2.weeks.from_now
    )
    assert_not new_borrowing.valid?
    assert_includes new_borrowing.errors[:book], "is already borrowed"
  end

  test "return_book sets returned_at" do
    borrowing = borrowings(:borrowing_one)
    borrowing.return_book
    assert_not_nil borrowing.returned_at
  end
end
