class Party < ApplicationRecord


	belongs_to :user

	has_many :groups

	has_many :gists

	has_many :visitors


	has_attached_file :picture, 

	                 :styles => { thumb: "80x80", medium: "300x300", large: "800x800" }, default_url: "/images/:style/PartyPicture.png"

   
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

	
end
