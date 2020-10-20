class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_project

  # POST /projects
  # POST /projects.json
  def create
    @project.events.create(
      content_type: request.content_type,
      body: request.raw_post,
      headers: request_headers
    )
    head :ok
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find_by!(token: params[:token])
    end

    def request_headers
      request.env.select {|k,v|
        k.match("^HTTP.*|^CONTENT.*|^REMOTE.*|^REQUEST.*|^AUTHORIZATION.*|^SCRIPT.*|^SERVER.*")
      }
    end
end
