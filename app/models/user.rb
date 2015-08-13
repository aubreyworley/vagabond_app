class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy

  has_attached_file :avatar,
  									:styles => { :medium => "150x150>", :thumb => "44x44>" },
  									:default_url => "/images/:style/missing.png"
	validates_attachment :avatar, :presence => true,
	                     :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
	                     :size => { :in => 0..100000.kilobytes } 					
  
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_secure_password
  validates :email, uniqueness: true
  
end
