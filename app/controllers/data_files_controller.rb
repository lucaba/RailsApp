class DataFilesController < ApplicationController

  def index
    @datafile = current_user.data_file.all
  end

  def new
    @datafile = DataFile.new
  end

  def create

  end

  def show

  end

  def destroy

  end
end
