module RequestHelpers
  def stub_request_from_file(method, url, stub_file: nil)
    stub_request(method, url)
      .with(
        headers: {
          'Accept'       => "application/json",
          'Content-Type' => "application/json",
        }
      )
      .to_return(
        read_stub_file(stub_file)
      )
  end

  def read_stub_file(file_name)
    stub_file = Pathname.getwd + "spec/api_requests/#{file_name}"
    File.open(stub_file, 'r')
  end
end
