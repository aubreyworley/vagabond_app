class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy

  has_attached_file :avatar,
  									:styles => { :medium => "150x150>", :thumb => "44x44>" },
                    :storage => :s3,
                    :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
                    :path => "avatars/:id/:style/avatar.:extension",
                    :default_url => "https://s3.amazonaws.com/vagabondapp/defaults/default_avatar.png"
	
  validates_attachment :avatar, :presence => true,
	                     :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
	                     :size => { :in => 0..100000.kilobytes } 					
  
  def s3_credentials
   { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_ACCESS_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_secure_password
  validates :email, uniqueness: true
  
end
