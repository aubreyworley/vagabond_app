class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy

  has_secure_password
  validates :email, uniqueness: true
  
end
