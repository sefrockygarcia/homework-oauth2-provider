class Api::UsersController < ApiController
  def index
    users = current_resource_owner.users.where admin: false
    respond_with users
  end

  def me
    respond_with current_resource_owner
  end

  def create
    user = current_resource_owner.users.build user_params
    if user.save
      render status: :ok, json: user
    else
      render status: :unprocessable_entity, json: {error: user.errors.full_messages.to_sentence}
    end
  end

  def update
    user = User.find_by user_id: params[:id]
    if user.update user_params
      render status: :ok, json: user
    else
      render status: :unprocessable_entity, json: {error: user.errors.full_messages.to_sentence}
    end
  end

  def destroy
    user = User.find_by user_id: params[:id]
    user.destroy
    render status: :ok
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :user_id)
    end
end