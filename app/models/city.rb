class City < ActiveRecord::Base
	extend FriendlyId
	friendly_id :city_name, use: :slugged
	has_many :stories, dependent: :destroy
end
