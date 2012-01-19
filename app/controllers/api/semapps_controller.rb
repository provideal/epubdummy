class Api::SemappsController < Api::ApplicationController

  def index
    semapps = Semapp.all
    render xml: semapps.to_xml
  end

  def show
    semapp = Semapp.find(params[:id])
    render xml: semapp.to_xml(epubs: true)
  end

end