class DataFilesController < ApplicationController

  before_action :signed_in_user
  before_action :correct_user

  def index
    @datafile = current_user.data_file.all
  end

  def new
    @datafile = DataFile.new
  end

  def create

    @datafile = DataFile.new

    uploaded_io = params[:data_file]

    flash[:error]= '' + uploaded_io.to_s


    redirect_to new_user_data_file_url
  end

  def show

  end

  def destroy

  end

  private

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless current_user?(@user)
    end
end
