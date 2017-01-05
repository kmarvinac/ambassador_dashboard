class School < ApplicationRecord
  # Direct associations

  has_many   :referrals

  has_many   :users,
             :dependent => :destroy

  # Indirect associations

  # Validations
  validates :school_name, presence: true
  validates :school_name, uniqueness: true

end
