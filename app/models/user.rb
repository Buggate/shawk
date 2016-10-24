class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  after_create :create_profile


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         


         has_many :parties
         has_one :profile

         has_many :comments

         has_many :gists

         #has_many :sent_notice, :class_name => "Notification", :foreign_key => 'host_id'

         #has_many :notice, :class_name => "Notification", :foreign_key => 'guest_id'

        
         has_many :confirmation, :class_name => "Reservation", :foreign_key => 'guest_id'



  

         has_many :invitations, :class_name => "Invite", :foreign_key => 'guest_id'
         has_many :sent_invites, :class_name => "Invite", :foreign_key => 'host_id'


         has_many :visitors
         has_many :groups, through: :visitors

         has_many :notifications



  private

         def create_profile


         	Profile.create(user_id: self.id,

         		            name: self.name)

         end
     

    
end
