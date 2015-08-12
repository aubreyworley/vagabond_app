class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  validates :title, presence: true, length: {minimum: 1, maximum: 10}
  validates :body, presence: true
end
