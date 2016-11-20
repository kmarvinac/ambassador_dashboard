class School < ApplicationRecord
  # Direct associations

  has_many   :referrals

  has_many   :users,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
