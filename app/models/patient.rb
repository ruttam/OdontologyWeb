class Patient < ActiveRecord::Base

  validates :name, presence: true
  validates :surname, presence: true
  validates :second_email, presence: true
  validates :telephoneNr, presence: true
  validates :address, presence: true

  validates :personalCode, :uniqueness => true

  belongs_to :user
  has_many :appointments

end
