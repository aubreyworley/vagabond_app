class City < ActiveRecord::Base
	extend FriendlyId

	has_attached_file :citypic,
  									:styles => { :medium => "150x150>", :thumb => "44x44>" },
  									:default_url => "/images/:style/missing.png"
	validates_attachment :citypic, :presence => true,
	                     :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
	                     :size => { :in => 0..100000.kilobytes } 					

	friendly_id :city_name, use: :slugged
	has_many :stories, dependent: :destroy
end
