require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :typhoeus
  c.ignore_localhost = true
  c.default_cassette_options = { record: :new_episodes,
                     re_record_interval: 7.days }
  c.configure_rspec_metadata!
  # Uncomment if you want to scrub some sensitive data from the cassettes
  #c.filter_sensitive_data('scrubbed') { "some sensitive data" }
end
