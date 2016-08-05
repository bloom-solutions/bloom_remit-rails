module BloomRemit
  class Txn < ActiveRecord::Base

    belongs_to :sender, polymorphic: true
    belongs_to :owner, polymorphic: true

    enum status: {
      bank_error: -2,
      incomplete: 0,
      paid: 1,
      completed: 3,
      rejected: 4,
      refunded: 5,
      cancelled: 6,
      error: 7,
      delayed: 8,
      waiting: 9,
      unpaid: 10,
      outstanding: 11,
    }

  end
end
