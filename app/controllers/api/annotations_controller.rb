
# Curl Examples
#
# Create:
#   curl --user admin:admin --data "data='<annotation></annotation>'" http://localhost:3001/api/scenarios/:scenario_id/annotations
#
# Update:
#   curl --user admin:admin -X PUT --data "data='<annotation></annotation>'" http://localhost:3001/api/annotations/:id
#
# Delete:
#   curl --user admin:admin -X DELETE http://localhost:3001/api/annotations/:id

class Api::AnnotationsController < Api::ApplicationController

  def index
    @scenario    = Scenario.find(params[:scenario_id])
    @annotations = @scenario.annotations

    if @scenario.version == 2
      @annotations = @annotations.where(user_id: current_user.id)
    end
  end

  def show
    @annotation = Annotation.find(params[:id])
    if @annotation.scenario.version == 2
      authorize! :read, @annotation
    end
  end

  def create
    authorize! :create, Annotation

    @scenario  = Scenario.find(params[:scenario_id])
    @annotation = Annotation.new(user: current_user, data: params[:data])
    @scenario.annotations << @annotation
  end

  def update
    @annotation = Annotation.find(params[:id])
    authorize! :update, @annotation
    @annotation.update_attribute(:data, params[:data])
  end

  def destroy
    @annotation = Annotation.find(params[:id])
    authorize! :update, @annotation
    @annotation.destroy
    render nothing: true
  end

end