# app/controllers/books_controller.rb
class BooksController < ApplicationController
  # Only logged-in users can add new books.
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  # Display the form for a new book.
  def new
    @book = Book.new
  end

  # Save the new book.
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: 'New book created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn)
  end
end
