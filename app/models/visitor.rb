class Visitor < ApplicationRecord


	belongs_to :user
	belongs_to :group

	belongs_to :party

	belongs_to :invite

	has_many :reservations

	has_many :comments

	has_one :notification

	has_many :gists


	
end


