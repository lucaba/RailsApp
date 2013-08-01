class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user # The HTTP spec requires the full URL when rendirecting
    else
      flash.now[:error] = 'Invalid email/password combination'
      render new_session_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url # The HTTP spec requires the full URL when rendirecting
  end

end
