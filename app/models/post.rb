class Post < ApplicationRecord
    belongs_to :topic
    validates_presence_of :contributor
    validates_presence_of :content
    mount_uploader :img, ImgUploader
    
    
  
  
  

end
