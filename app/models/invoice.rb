class Invoice < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :dollar_amount, presence: true
  validates :dollar_amount, numericality: true

  validates :requestor_notes, presence: true

  rails_admin do
    list do
      field :id
      field :user
      field :dollar_amount
      field :requestor_notes
      field :submitted_on
      field :approved
      field :approver_name
    end

    show do
      field :user
      field :dollar_amount
      field :requestor_notes
    end
  end
end
