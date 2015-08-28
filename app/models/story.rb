class Story < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
	
  belongs_to :user
  belongs_to :city

  validates :title, presence: true, length: {minimum: 1, maximum: 200}
  validates :body, presence: true

  has_many :StoriesTags
  has_many :tags, through: :StoriesTags

end
