class Wiki < ApplicationRecord
  has_many :collaborators, dependent: :destroy
    has_many :users, through: :collaborators
end
