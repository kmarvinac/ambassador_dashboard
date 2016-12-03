class Invoice < ApplicationRecord
  # Direct associations

  belongs_to :ambassador,
             :class_name => "User",
             :foreign_key => "requestor_user_id",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :dollar_amount, presence: true
  validates :dollar_amount, numericality: true

  validates :requestor_notes, presence: true

end
