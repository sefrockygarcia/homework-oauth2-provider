class ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :doorkeeper_authorize!
  respond_to :json

  private
    def current_resource_owner
      Company.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
    # helper_method :current_resource_owner
end