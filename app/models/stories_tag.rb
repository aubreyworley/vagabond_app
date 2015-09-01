class StoriesTag < ActiveRecord::Base
  belongs_to :story
  belongs_to :tag
end
