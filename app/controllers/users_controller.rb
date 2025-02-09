# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!

  # Profile page showing all active (not returned) borrowings.
  def show
    @borrowings = current_user.borrowings.where(returned_at: nil)
  end
end
