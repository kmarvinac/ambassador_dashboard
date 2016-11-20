class User < ApplicationRecord
  # Direct associations

  has_many   :invoices,
             :foreign_key => "requestor_user_id"

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
