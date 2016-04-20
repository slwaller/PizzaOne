class Company < ActiveRecord::Base
  has_many :deals

  validates :name, presence: true
  validates :number, presence: true
  validates :email, presence: true
  validates :address, presence: true

  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  geocoded_by :address
  after_validation :geocode
end
