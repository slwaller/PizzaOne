class Company < ActiveRecord::Base
  has_many :deals

  validates :name, presence: true
  validates :number, presence: true
  validates :email, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode
end
