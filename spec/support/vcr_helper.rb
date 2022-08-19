require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
  c.filter_sensitive_data('<API KEY>') { Rails.application.credentials[:twitter][:consumer_key] }
  c.filter_sensitive_data('<API SECRET KEY>') { Rails.application.credentials[:twitter][:consumer_secret] }
  c.filter_sensitive_data('<ACCESS TOKEN>') { Rails.application.credentials[:twitter][:access_token] }
  c.filter_sensitive_data('<ACCESS TOKEN SECRET>') { Rails.application.credentials[:twitter][:access_token_secret] }
end