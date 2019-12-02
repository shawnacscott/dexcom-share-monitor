require 'rails_helper'
require 'facebook/api_client'

RSpec.describe Facebook::ApiClient do
  subject(:api_client) { described_class.new }

  let(:base_path)      { "#{Setting.facebook(:api_endpoint)}#{Setting.facebook(:page_id)}/feed" }
  let(:query_string)   { "?access_token=#{Setting.facebook(:page_access_token)}&message=#{message}" }
  let(:message)        { 'My cool new post' }
  let(:request_path)   { base_path + query_string }


  describe '.post_to_page' do
    context 'a successful request' do
      before do
        stub_request_from_file(:post, request_path, stub_file: 'facebook/page_posts/ok.txt')
      end

      it 'posts a new message to a Facebook Page' do
        api_client.post_to_page(message: message)

        expect(WebMock).to have_requested(:post, request_path)
      end

      it 'returns a success status' do
        resp = api_client.post_to_page(message: message)

        expect(resp.status).to be(200)
      end
    end

    context 'a bad request' do
      context 'with expired access tokens' do
        xit 'has some tests' do

        end
      end
    end
  end
end
