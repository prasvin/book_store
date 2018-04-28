class UsersController < ApplicationController
  # GET /users
  def index
    users = User.all

    respond_with users, each_serializer: Users::IndexSerializer
  end

  # GET /users/:id
  def show
    user = User.find(params[:id])

    respond_with user, serializer: Users::ShowSerializer
  end
end
