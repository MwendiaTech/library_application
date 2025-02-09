# app/models/borrowing.rb
class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :borrowed_at, :due_date, presence: true
  validate :book_available, on: :create

  # Custom validation: do not allow borrowing if the book is not available.
  def book_available
    errors.add(:book, "is already borrowed") unless book.available?
  end

  # Marks the borrowing as returned.
  def return_book
    update(returned_at: Time.current)
  end
end
