class Profile < ApplicationRecord



	belongs_to :user
    

    has_many :gists


	has_attached_file :image, 
	                   :styles => { thumb: "80x80", medium: "300x300", large: "800x800" }, default_url: "/images/:style/YourPhoto.png"

    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
