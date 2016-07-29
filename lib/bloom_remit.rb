require "storext"
require "sidekiq"
require "active_support/core_ext/module/attribute_accessors"
require "bloom_remit_client"
require "bloom_remit/engine"

module BloomRemit

  mattr_accessor :token
  mattr_accessor :secret
  mattr_accessor :agent_id
  mattr_accessor :url

  def self.configure(&block)
    yield self
  end

end
