require 'facebook/api_client'

class Facebook::PostsController < ApplicationController
  def create
    resp = api_client.post_to_page(message: create_params[:message])
    render json: resp.body, status: resp.status
  end

  private

  def api_client
    @api_client ||= Facebook::ApiClient.new
  end

  def create_params
    params.require(:post).permit(
      :message
    )
  end
end
