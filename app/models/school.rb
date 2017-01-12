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
    ambassador_schools = [
                          "Brigham Young University—Provo",
                          "DePaul University",
                          "Indiana University—Bloomington",
                          "Pennsylvania State University—University Park",
                          "University of California—Berkeley",
                          "University of California—Davis",
                          "University of California—Los Angeles (UCLA)",
                          "University of Florida",
                          "University of Illinois—Urbana-Champaign",
                          "University of Michigan—Ann Arbor",
                          "University of North Carolina—Chapel Hill",
                          "University of Virginia"
                         ]
    where(school_name: ambassador_schools).order(:school_name)
  end

end
