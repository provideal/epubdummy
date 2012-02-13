class Api::SemappsController < Api::ApplicationController

  def index
    @semapps = Semapp.all
  end

  def show
    @semapp = Semapp.find(params[:id])
  end

end