class Referral < ApplicationRecord
  # Direct associations

  belongs_to :referrer,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
