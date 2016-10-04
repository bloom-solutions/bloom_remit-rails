# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [0.11.0] - 2016-10-04
### Changed
- `OnUpdateJob` no longer receives `vendor_external_id`, but rather, `tracking_number`

## [0.10.0] - 2016-10-04
### Changed
- Use unified endpoint for creating transactions

## [0.9.0] - 2016-09-30
### Changed
- Do not require `account_id` when creating a txn. Cash pickups do not need this.
- Do not require `external_id` when creating a txn

## [0.8.0] - 2016-09-20
### Changed
- Change `url` configuration setting to `host`
- Allow to configure `sandbox`, which makes setting of `url` optional
- Use BloomRemitClient v0.7.1

## [0.7.0]
### Added
- When creation of txn fails, mark Txn as error

## [0.6.1] - 2016-08-31
### Fixed
- Specify full constant path to avoid conflicts

## [0.6.0] - 2016-08-17
### Added
- Update `Txn#vendor_external_id` during callback from Bloom Remit

## [0.5.0] - 2016-08-09
### Added
- Update `Txn#status_description` during callback from Bloom Remit

### Fixed
- Do not make Txn secret updatable

## [0.4.1] - 2016-08-08
### Fixed
- Ensure that the `TxnsController` inherits from this engine's `ApplicationController`

## [0.4.0] - 2016-08-08
### Changed
- Change migration name to include "bloom_remit" to avoid conflicts

## [0.3.0] - 2016-08-08
### Changed
- Require that `Txn#external_id` is set

## [0.2.1] - 2016-08-08
### Fixed
- Do not check CSRF token for API

## [0.2.0] - 2016-08-08
### Added
- Support POST for updating the Txn

## [0.1.0] - 2016-08-06
### Added
- Factories that developers can require (`require 'bloom_remit/factories'`) for development
- Add a way to hook into the update of `BloomRemit::Txn` (`BloomRemit.on_txn_update`)
- Add `Txn#owner` to assign the Txn to a commercial document (like a "payment" in the native app)

### Changed
- `Txn#sender_id` is now a string, to support sender tables that use strings as primary keys
- Pass `target_slug` into `BloomRemit::Txn` instead of the recipient. Target slug may be the slug of the billers, or banks
- Drop `BloomRemit.on_txn_update` and change to `BloomRemit.on_txn_response`, which will be executed anytime the server responds with something.

### Fixed
- Enqueueing of Txn PayoutJob
- Enqueue jobs only when database change has been committed

### Removed
- `Txn#recipient`. We do not need this polymorphic relationship; only the `target_slug`
- Native biller syncing. Let the app users create their own biller tables and call `BloomRemitClient`

## [0.0.1] - 2016-08-02
### Added
- Be able to sync billers
- Be able to create transactions (Txn) for bills payment
