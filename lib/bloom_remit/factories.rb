Dir[File.expand_path("../factories/*.rb", __FILE__)].each {|f| require f}
require 'bloom_remit_client/factories'
