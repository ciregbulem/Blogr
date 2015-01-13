class AddAttachmentFeatureToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :feature
    end
  end

  def self.down
    remove_attachment :articles, :feature
  end
end
