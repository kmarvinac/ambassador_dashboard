class School < ApplicationRecord
  # Direct associations

  has_many   :referrals

  has_many   :users,
             :dependent => :destroy

  # Indirect associations

  # Validations
  validates :school_name, presence: true
  validates :school_name, uniqueness: true

  def self.ambassador_schools
    ambassador_schools = ["University of Michigan—Ann Arbor", "University of Illinois—Urbana-Champaign", "DePaul University"]
    where(school_name: ambassador_schools)
  end

end
