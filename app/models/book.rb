# app/models/book.rb
class Book < ApplicationRecord
  has_many :borrowings, dependent: :destroy
  has_many :users, through: :borrowings

  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true

  # Returns true if no active (i.e. not returned) borrowing exists.
  def available?
    borrowings.where(returned_at: nil).empty?
  end
end
