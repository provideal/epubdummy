class Api::SemappController < ApplicationController

  def index
    semapps = Semapp.all
    render xml: semapps.to_xml
  end

  def show
    semapp = Semapp.find(params[:semapp_id])
    render xml: semapp.to_xml(epubs: true)
  end

end