class City < ActiveRecord::Base
	has_many :stories, dependent: :destroy
end
