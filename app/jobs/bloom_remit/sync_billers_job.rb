module BloomRemit
  class SyncBillersJob

    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform
      Billers::Sync.()
    end

  end
end

if Sidekiq.server?
  Sidekiq::Cron::Job.create(
    class: BloomRemit::SyncBillersJob.name,
    cron: '0 * * * *',
  )
end
