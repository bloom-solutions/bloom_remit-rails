module BloomRemit
  class Biller < ActiveRecord::Base

    scope :active, -> { where(deactivated_at: nil) }

    include Storext.model
    store_attributes(:fields) do
      first_field String
      first_field_format String
      first_field_width Integer
      second_field String
      second_field_format String
      second_field_width Integer
    end

    def active?
      self.deactivated_at.nil?
    end

  end
end
