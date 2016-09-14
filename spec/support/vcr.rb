require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  sensitive_vars = %w[BLOOM_REMIT_TOKEN BLOOM_REMIT_SECRET BLOOM_REMIT_AGENT_ID]
  sensitive_vars.each do |var|
    c.filter_sensitive_data("[#{var}]") { ENV[var] }
  end
end
