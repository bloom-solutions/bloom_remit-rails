# Rails engine for Bloom Remit

## Installation

- Add `gem "bloom_remit"` to your Gemfile
- `bundle`
- `rake bloom_remit:install:migrations`
- `rake db:migrate`

## Configuration

In an initializer:

```ruby
BloomRemit.configure do |c|
  c.token = ENV["BLOOM_REMIT_TOKEN"]
  c.secret = ENV["BLOOM_REMIT_SECRET"]
  c.agent_id = ENV["BLOOM_REMIT_AGENT_ID"]
  c.url = ENV["BLOOM_REMIT_URL"]
  # c.sender_id_method = :external_id
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

## Factory Girl

You may require the `bloom_remit/factories` file if you need access to this gem's factories (easier application development).

## Development

- In `spec/dummy/config`, copy `database.yml.sample` to `database.yml` and fill in your db details
- Copy `.env` to `.env.local` and make it match your credentials

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
