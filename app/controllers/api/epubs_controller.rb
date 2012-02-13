class Api::EpubsController < Api::ApplicationController

  def index
    @semapp = Semapp.find(params[:semapp_id])
    @epubs  = @semapp.epubs
  end

  def show
    @epub = Epub.find(params[:id])
  end

end