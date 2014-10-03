class Deal < ActiveRecord::Base
  belongs_to :company

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :avatar, presence: true

  has_attached_file :avatar

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
