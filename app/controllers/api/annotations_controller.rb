class Api::AnnotationsController < Api::ApplicationController

  before_filter :setup_semapp_and_epub


  def index
    @annotations = @epub.annotations
    authorize! :read, @annotations
    render xml: @annotations.to_xml
  end

  def create
    authorize! :create, Annotation
    annotation = Annotation.new(data: params[:data], user_id: current_user.id)
    @epub.annotations << annotation
    annotation.save
    render xml: annotation.to_xml
  end

  def update
    annotation = @epub.annotations.find(params[:id])
    authorize! :update, annotation
    annotation.update_attribute(:data, params[:data])
    render xml: annotation.to_xml
  end

  def destroy
    annotation = @epub.annotations.find(params[:id])
    authorize! :update, annotation
    annotation.destroy
    render nothing: true
  end

  private

  def setup_semapp_and_epub
    @semapp = Semapp.find(params[:semapp_id])
    @epub   = @semapp.epubs.find(params[:epub_id])
  end

end