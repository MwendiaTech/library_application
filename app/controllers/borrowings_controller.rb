# app/controllers/borrowings_controller.rb
class BorrowingsController < ApplicationController
  before_action :authenticate_user!

  # Create a borrowing record when a user borrows a book.
  def create
    @book = Book.find(params[:book_id])
    @borrowing = Borrowing.new(
      user: current_user,
      book: @book,
      borrowed_at: Time.current,
      due_date: 2.weeks.from_now
    )
    if @borrowing.save
      redirect_to books_path, notice: "Book borrowed successfully."
    else
      redirect_to book_path(@book), alert: @borrowing.errors.full_messages.to_sentence
    end
  end

  # Mark a borrowing as returned.
  def destroy
    @borrowing = current_user.borrowings.find(params[:id])
    if @borrowing.return_book
      redirect_to profile_path, notice: "Book returned successfully."
    else
      redirect_to profile_path, alert: "Unable to return book."
    end
  end
end
