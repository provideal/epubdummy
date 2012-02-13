class Api::ScenariosController < Api::ApplicationController

  def index
    @epub      = Epub.find(params[:epub_id])
    @scenarios = @epub.scenarios
    unless current_user.is?(:admin)
      @scenarios = @scenarios.where(active: true)
    end
  end

  def show
    @scenario = Scenario.find(params[:id])
    authorize! :read, @scenario
  end

end