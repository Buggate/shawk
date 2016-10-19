class Gist < ApplicationRecord

  

	belongs_to :group

	belongs_to :profile

	belongs_to :visitor





	has_attached_file :image, 

	                 :styles => { thumb: "80x80", medium: "300x300", large: "800x800" }, default_url: "/images/:style/AddGist.png"

   
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    #validates_attachment :image,
     #                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

   


end
