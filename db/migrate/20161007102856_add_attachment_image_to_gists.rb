class AddAttachmentImageToGists < ActiveRecord::Migration
  def self.up
    change_table :gists do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :gists, :image
  end
end
