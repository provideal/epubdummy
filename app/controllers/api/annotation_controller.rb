class Api::AnnotationController < ApplicationController

  def create
    semapp = Semapp.find(params[:semapp_id])
    epub   = semapp.epubs.find(params[:epub_id])
    epub.annotations << Annotation.new(data: params[:data])
    render xml: epub.to_xml
  end

  def update
    semapp     = Semapp.find(params[:semapp_id])
    epub       = semapp.epubs.find(params[:epub_id])
    annotation = epub.annotations.find(params[:id])
    annotation.update_attributes(params[:annotation])
    render xml: epub.to_xml
  end

end