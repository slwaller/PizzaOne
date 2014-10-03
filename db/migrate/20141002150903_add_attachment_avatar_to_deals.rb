class AddAttachmentAvatarToDeals < ActiveRecord::Migration
  def self.up
    change_table :deals do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :deals, :avatar
  end
end
