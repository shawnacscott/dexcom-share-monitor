class Facebook::PostsController < ApplicationController
  # curl -i -X POST \
  # "https://graph.facebook.com/v5.0/${ENV[FACEBOOK_PAGE_ID]}/feed?message=${create_params[:message], URL encoded}&access_token=${ENV[FACEBOOK_PAGE_ACCESS_TOKEN]}"
  def create
    render json: { message: create_params[:message] }
  end

  private

  def create_params
    params.permit(
      :message
    )
  end
end
