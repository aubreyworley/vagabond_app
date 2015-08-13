class Tag < ActiveRecord::Base
  has_many :StoriesTags
  has_many :stories, through: :StoriesTags
end
