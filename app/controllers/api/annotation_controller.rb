class Api::AnnotationController < ApplicationController

  before_filter :setup_semapp_and_epub

  def create
    @epub.annotations << Annotation.new(data: params[:data])
    render nothing: true
  end

  def update
    annotation = @epub.annotations.find(params[:id])
    annotation.update_attribute(:data, params[:data])
    render nothing: true
  end

  def destroy
    annotation = @epub.annotations.find(params[:id])
    annotation.destroy
    render nothing: true
  end

  private

  def setup_semapp_and_epub
    @semapp = Semapp.find(params[:semapp_id])
    @epub   = @semapp.epubs.find(params[:epub_id])
  end

end