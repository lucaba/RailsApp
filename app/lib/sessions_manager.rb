module SessionsManager
  def self.included(base)
    base.send :helper_method, :current_user
    base.send :helper_method, :signed_in?
  end

  # Signs in a user
  # ==== Attributes
  # * +user+ - The user to sign in
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token # Puts a cookie in the browser
    user.update_attribute(:remember_token, User.encrypt(remember_token))  # Updates the user's remember token in the
                                                        # database
    self.current_user = user # Sets the user to the instance variable @current_user
  end

  # Returns true if the current user is signed in, returns false otherwise
  def signed_in?
    !current_user.nil?
  end

  # Sets a current user
  # ==== Atributes
  # * +user+ - The user to assign as the current user
  def current_user=(user)
    @current_user = user
  end

  # Returns the current user
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token) # Finds the user of based on its browser cookie
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end