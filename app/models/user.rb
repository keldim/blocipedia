class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :collaborators
  has_many :wikis, through: :collaborators
  after_initialize { self.role ||= :standard }
  enum role: [:standard, :premium, :admin]
end
