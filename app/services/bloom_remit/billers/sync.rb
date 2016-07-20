module BloomRemit
  module Billers
    class Sync

      def self.call
        client = BloomRemitClient.new(
          token: ENV["BLOOM_REMIT_TOKEN"],
          secret: ENV["BLOOM_REMIT_SECRET"],
        )
        client.billers.billers.each do |remote_biller|
          biller = Biller.where(slug: remote_biller.slug).first_or_initialize
          biller.update_attributes(remote_biller.attributes)
        end
      end

    end
  end
end
