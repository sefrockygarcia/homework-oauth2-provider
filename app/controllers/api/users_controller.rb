class Api::UsersController < ApiController
  before_action :doorkeeper_authorize!
  respond_to :json

  def index
    users = User.where admin: false
    respond_with users
  end
end