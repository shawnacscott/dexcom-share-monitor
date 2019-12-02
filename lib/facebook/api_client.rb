class Facebook::ApiClient
  def initialize
    @connection = Faraday.new(
      url:     Setting.facebook(:api_endpoint),
      params:  { access_token: Setting.facebook(:page_access_token) },
      headers: {
        'Content-Type' => 'application/json',
        'Accept'       => 'application/json'
      }
    )
  end

  # curl -i -X POST \
  # "https://graph.facebook.com/v5.0/#{Setting.facebook(:page_id)}/feed?message=#{URL-encoded message}&access_token=#{Setting.facebook(:page_access_token)}"
  def post_to_page(message:)
    req_path = "#{Setting.facebook(:page_id)}/feed"

    connection.post(req_path) do |req|
      req.params[:message] = message
    end
  end

  private
  attr_reader :connection
end
