class Referral < ApplicationRecord
  # Direct associations

  belongs_to :school,
             :counter_cache => true

  belongs_to :referrer,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations
  

end
