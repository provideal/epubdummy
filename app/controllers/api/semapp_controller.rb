class Api::SemappController < ApplicationController

  def index
    semapps = Semapp.all
    render json: semapps.to_json(except: [:epubs])
  end

  def show
    semapp = Semapp.find(params[:semapp_id])
    render json: semapp.to_json()
  end

end