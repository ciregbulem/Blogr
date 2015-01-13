class Article < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true, length: { minimum: 2}
	validates :text, presence: true
	has_attached_file :feature, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/system/articles/thumb/missing.png"
  	validates_attachment_content_type :feature, :content_type => /\Aimage\/.*\Z/
end
