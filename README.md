# Rails engine for Bloom Remit

## Installation

- Add `gem "bloom_remit"` to your Gemfile
- `bundle`
- `rake bloom_remit:install:migrations`
- `rake db:migrate`

## Development

- In `spec/dummy/config`, copy `database.yml.sample` to `database.yml` and fill in your db details
- Copy `.env` to `.env.local` and make it match your credentials

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
