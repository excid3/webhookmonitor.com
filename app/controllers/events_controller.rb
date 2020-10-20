class EventsController < ApplicationController
  before_action :set_project
  before_action :set_event

  def show
  end

  def destroy
    @event.destroy
    redirect_to @project, notice: "Event was deleted successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_event
      @event = @project.events.find(params[:id])
    end
end

