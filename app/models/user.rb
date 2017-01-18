class User < ApplicationRecord
  # Direct associations

  belongs_to :school

  has_many   :invoices

  # Indirect associations

  # Validations
  validates :school, presence: true
  validates :cell_phone_number, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def name
    "#{self.first_name} #{self.last_name}"
  end
end
