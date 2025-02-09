# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
alice = User.create!(email: "alice@gmail.com", password: "password", password_confirmation: "password")
bob   = User.create!(email: "bob@gmail.com",   password: "password", password_confirmation: "password")

# Create books (at least 5 real books)
books = Book.create!([
                       { title: "To Kill a Mockingbird", author: "Harper Lee",         isbn: "9780061120084" },
                       { title: "1984",                  author: "George Orwell",        isbn: "9780451524935" },
                       { title: "The Great Gatsby",      author: "F. Scott Fitzgerald",  isbn: "9780743273565" },
                       { title: "Pride and Prejudice",   author: "Jane Austen",          isbn: "9780141439518" },
                       { title: "The Catcher in the Rye",author: "J.D. Salinger",        isbn: "9780316769488" }
                     ])

# Create a sample borrowing record.
# For example, let Alice borrow "1984".
borrowing = Borrowing.create!(
  user: alice,
  book: books.find { |b| b.title == "1984" },
  borrowed_at: Time.current,
  due_date: 2.weeks.from_now
)

puts "Seeding completed successfully!"