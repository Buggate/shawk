class Group < ApplicationRecord

	belongs_to :party

	has_many :invites

	has_many :reservations

	has_many :comments

	has_many :visitors
	has_many :users, through: :visitors

	has_many :notifications

	has_many :gists
	

	

	
end
