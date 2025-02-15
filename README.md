
# LibraryApplication

A simple book lending library application built with Ruby on Rails 8, Devise, and Bootstrap.

## Features

- **User Authentication:** Managed by Devise.
- **Books Management:** Users can view a list of books, see details, and (if authorized) add new books.
- **Borrowing System:** Authenticated users can borrow books (which creates a borrowing record with a due date) and return them.
- **User Profile:** View active (not yet returned) borrowings.
- **Test Coverage:** Uses fixtures with Minitest for models, controllers, and system tests.

## Environment Preparation (Ubuntu)

The following instructions assume you are running Ubuntu 20.04 LTS (or later).

### 1. Installing Ruby

First, install the dependencies required for compiling Ruby:

```bash
sudo apt-get update
sudo apt install build-essential rustc libssl-dev libyaml-dev zlib1g-dev libgmp-dev
```

Next, install Ruby using the version manager **Mise**. This makes updating and switching Ruby versions easy.

```bash
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate)"' >> ~/.bashrc
source ~/.bashrc
```

Then install Ruby with Mise:

```bash
mise use --global ruby@3
```

Confirm Ruby is installed:

```bash
ruby --version
# Expected output, e.g.: ruby 3.4.1
```

### 2. Installing Rails

Install Rails 8.0.1 (recommended):

```bash
gem install rails -v 8.0.1
```

Verify Rails installation:

```bash
rails -v
# Expected output: Rails 8.0.1
```

### 3. Setting Up the Database

This application uses **SQLite3** by default. Install SQLite3 and its development libraries:

```bash
sudo apt update
sudo apt install sqlite3 libsqlite3-dev
```

(If you prefer MySQL or PostgreSQL, follow their respective installation instructions.)

### 4. Installing Node.js & Yarn

Install Node.js and Yarn:

```bash
sudo apt install nodejs npm
sudo npm install --global yarn
```

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/MwendiaTech/library_application.git
   cd library_application
   ```

2. **Install Dependencies:**

   ```bash
   bundle install
   yarn install
   ```

3. **Set Up the Database:**

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

## Running the Application

Start the Rails server:

```bash
rails server
```

Then open [http://localhost:3000](http://localhost:3000) in your browser.

## Running Tests

Run all tests with:

```bash
rails test
```

## Git Commit Guidelines

- Write clear and descriptive commit messages.
- Group related changes in logical commits (e.g., "Implement borrowing system", "Add model validations", "Update views with Bootstrap").

## License

This project is licensed under the MIT License.
```
