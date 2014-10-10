class Company < ActiveRecord::Base
  has_many :deals

  validates :name, presence: true
  validates :number, presence: true
  validates :email, presence: true
  validates :address, presence: true

  has_attached_file :avatar,
    :storage => :dropbox,
    :dropbox_credentials => { app_key: ENV['APP_KEY'],
                              app_secret: ENV['APP_SECRET'],
                              access_token: ENV['ACCESS_TOKEN'],
                              access_token_secret: ENV['ACCESS_TOKEN_SECRET'],
                              user_id: ENV['USER_ID'],
                              access_type: 'app_folder'}

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  geocoded_by :address
  after_validation :geocode
end
