class Article < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true, length: { minimum: 1}
	validates :text, presence: true
	has_attached_file :feature, :styles => { :cover => "851x851>", :large => "500x500#", :medium => "300x300#", :thumb => "100x100#" }, :url => ":s3_domain_url", :path => "/:class/:attachment/:id_partition/:style/:filename"
  	validates_attachment_content_type :feature, :content_type => /\Aimage\/.*\Z/
  	has_many :comments
end
