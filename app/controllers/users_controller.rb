class UsersController < ApplicationController
  # GET /users/:id
  def show
    user = User.find(params[:id])

    respond_with user
  end
end
