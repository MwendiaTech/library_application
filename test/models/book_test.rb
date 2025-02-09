require "test_helper"

class BookTest < ActiveSupport::TestCase
  fixtures :books, :borrowings

  test "should be valid" do
    book = books(:book_one)
    assert book.valid?
  end

  test "should require a title" do
    book = books(:book_one)
    book.title = ""
    assert_not book.valid?
  end

  test "should require an author" do
    book = books(:book_one)
    book.author = ""
    assert_not book.valid?
  end

  test "should require an isbn" do
    book = books(:book_one)
    book.isbn = ""
    assert_not book.valid?
  end

  test "isbn should be unique" do
    book = books(:book_one)
    duplicate_book = book.dup
    book.save!
    assert_not duplicate_book.valid?
  end

  test "book is available if no borrowings exist" do
    # Assuming book_two has no associated borrowings in fixtures
    book = books(:book_two)
    assert book.available?
  end

  test "book is not available if borrowed" do
    # book_one is borrowed in borrowing_one fixture
    book = books(:book_one)
    assert_not book.available?
  end
end
