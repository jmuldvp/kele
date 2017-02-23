require 'vcr'

VCR.configure do |c|
#the directory for your cassettes
  c.cassette_library_dir = 'spec/vcr_cassettes'
#your preferred http request service. Typhoeus and Fakeweb are other options
  c.hook_into :webmock

#filter sensitive data so they aren't visible in cassettes
  c.filter_sensitive_data('<EMAIL>') { URI.encode_www_form_component ENV['EMAIL'] }
  c.filter_sensitive_data('<PASSWORD>') { URI.encode_www_form_component ENV['PASSWORD'] }
  c.filter_sensitive_data('<MENTOR_ID>') { URI.encode_www_form_component ENV['MENTOR_ID'] }
  c.filter_sensitive_data('<ROADMAP_ID>') { URI.encode_www_form_component ENV['ROADMAP_ID'] }
  c.filter_sensitive_data('<CHECKPOINT_ID>') { URI.encode_www_form_component ENV['CHECKPOINT_ID'] }
  c.filter_sensitive_data('<PAGE>') { URI.encode_www_form_component ENV['PAGE'] }

#if a cassette doesn’t exist, VCR will record a new one
  c.default_cassette_options = {record: :new_episodes}
#integrates VCR with RSpec
  c.configure_rspec_metadata!


end
