class ConfigurationsController < ApplicationController


  def edit

  end

  def show
    @configuration = current_user.configuration
  end

  def destroy
  end

  private

    def configuration_params
      params.require(:configuration).permit(:content)
    end
end

