# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

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
