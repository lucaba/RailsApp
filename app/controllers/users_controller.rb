class UsersController < ApplicationController

  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:succes] = "Welcome to the Sample App!"
      redirect_to	user_path(@user)
    else
      render new_user_path
    end
  end

  private

    # Returns a hash with ONLY the permitted params
    def user_params
      params.require(:user).permit(:name, :surname1, :surname2, :email, :company, :password,
                                   :password_confirmation)
    end

end
