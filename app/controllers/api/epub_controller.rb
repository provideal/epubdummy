class Api::EpubController < ApplicationController

  def index
    semapp = Semapp.find(params[:semapp_id])
    render xml: semapp.to_xml()
  end

  def show
    semapp = Semapp.find(params[:semapp_id])
    epub   = semapp.epubs.find(params[:id])
    render xml: epub.to_xml()
  end

end