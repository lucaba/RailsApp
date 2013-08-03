class ConfigurationsController < ApplicationController

  before_action :signed_in_user, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]

  def edit

  end

  def show
    @configuration = current_user.configuration
    @username = current_user.name
  end

  def update

  end

  private

    def configuration_params
      params.require(:configuration).permit(:content)
    end

    def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_url) unless current_user?(@user)
    end

end

