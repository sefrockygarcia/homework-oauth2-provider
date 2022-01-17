class ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :doorkeeper_authorize!
  respond_to :json
end