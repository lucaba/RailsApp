class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsManager # Almost all methods for Controllers, few ones for Views

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

end
