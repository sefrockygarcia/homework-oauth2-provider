class Api::UsersController < ApiController
  def index
    users = User.where admin: false
    respond_with users
  end
end