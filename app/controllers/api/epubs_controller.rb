class Api::EpubsController < Api::ApplicationController

  before_filter :setup_semapp

  def index
    render xml: @semapp.epubs.to_xml
  end

  def show
    epub = @semapp.epubs.find(params[:id])
    render xml: epub.to_xml
  end

  private

  def setup_semapp
    @semapp = Semapp.find(params[:semapp_id])
  end

end