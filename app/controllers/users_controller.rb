class UsersController < ApplicationController


  def access
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      payload = {data: user.email}
      @user = {
        token: JWT.encode(payload, nil, 'none'),
        email: user.email,
        twitter: user.userable
      }
    else
      @messages = {error: 'InvalidUser'}
      render status: :conflict, template: 'layouts/errors'
    end
  end




end
