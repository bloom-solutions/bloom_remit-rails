# Rails engine for Bloom Remit

## Installation

- Add `gem "bloom_remit"` to your Gemfile
- `bundle`
- `rake bloom_remit:install:migrations`
- `rake db:migrate`
- Add `mount BloomRemit::Engine => "/bloom_remit"` to your app's routes:

```ruby
Rails.application.routes.draw do
  mount BloomRemit::Engine => "/bloom_remit"
  # others ...
end
```

## Configuration

In an initializer:

```ruby
BloomRemit.configure do |c|
  c.token = ENV["BLOOM_REMIT_TOKEN"]
  c.secret = ENV["BLOOM_REMIT_SECRET"]
  c.agent_id = ENV["BLOOM_REMIT_AGENT_ID"]
  c.url = ENV["BLOOM_REMIT_URL"]
  # c.sender_id_method = :external_id
  # c.on_txn_response = OnBloomRemitTxnResponse # See Callbacks for more info
end
```

Then, to make a txn (see `spec/services/bloom_remit/create_txn_spec.rb` for more details):

```ruby
txn = BloomRemit::CreateTxn.(
  recipient: biller,
  sender: user,
  amount: 800.0,
  account_name: "028109090",
  account_id: "Hooli X",
)
```

In the configuration, `sender_method_id` defaults to `:bloom_remit_id`. This is the method that is called on the `sender` record on a Txn to find out what the sender's ID is. The value of this column keeps track of the ID of the sender on the Bloom Remit system.

### Callbacks

- `on_txn_response` - this calls the class set whenever your app gets an update from Bloom Remit. It responds to call, and accepts the `txn`:

```ruby
class OnTxnResponse
  def self.call(txn, body_or_params)
    # Do something
  end
end
```

## Factory Girl

You may require the `bloom_remit/factories` file if you need access to this gem's factories (easier application development). Requiring this will also require `bloom_remit_client/factories`

## Development

- Copy `.env` to `.env.local` and make it match your credentials
- Copy `spec/dummy/config/database.yml.sample` to `spec/dummy/config/database.yml`
- If you use docker:
  - `docker-compose build`
  - `docker-compose run test bundle`
  - `docker-compose run test bundle exec rake db:create db:migrate`
  - `docker-compose run test bundle exec rspec`
- If you are not using docker:
  - Setup your PG database, and fill in the correct credentials in `spec/dummy/config/database.yml`
  - From `spec/dummy`, `rake db:migrate db:test:prepare`
  - `bundle install`
  - `appraisal install`
  - From the root dir of the gem, `rspec spec`

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
