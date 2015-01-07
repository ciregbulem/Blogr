class Article < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true, length: { minimum: 2}
	validates :text, presence: true
end
