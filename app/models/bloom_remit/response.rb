module BloomRemit
  class Response < ActiveRecord::Base

    store :body, coder: JSON
    belongs_to :txn, class_name: "BloomRemit::Txn"
    validates :body, presence: true

  end
end
