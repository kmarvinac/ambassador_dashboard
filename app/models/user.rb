class User < ApplicationRecord
  # Direct associations

  belongs_to :school

  has_many   :referrals,
             :foreign_key => "referrer_id"

  has_many   :invoices,
             :foreign_key => "requestor_user_id"

  # Indirect associations

  # Validations
  validates :school_name, presence: true, uniqueness: { scope: :email }
  validates :cell_phone_number, presence: true, numericality: { only_integer: true }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
