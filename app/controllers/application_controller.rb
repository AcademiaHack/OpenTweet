class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  protected
  def find_user
    if request.headers["X-Token"].present?
      payload = JWT.decode request.headers["X-Token"], nil, false
      @current_user = User.find_by email: payload.first['data']
      @current_twitter = @current_user.userable
    else
      @messages = ['SetXTokenHeader']
      render status: :conflict, template: 'layouts/errors'
    end
  end

  private
  def record_not_found
    @messages = ['UserNotFound']
    render status: :conflict, template: 'layouts/errors'
  end
end
