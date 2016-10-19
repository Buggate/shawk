class Invite < ApplicationRecord




    before_save :generate_token
  # after_create :new_user
    before_save :check_user_existence

    belongs_to :group
    belongs_to :host, :class_name => 'User', optional: true
    belongs_to :guest, :class_name => 'User', optional: true

    has_many :notifications

    has_one :visitor

   
    
   


    



 private

  def generate_token

      self.token = Digest::SHA1.hexdigest([self.group_id, Time.now, rand].join)

  end


 def new_user
   
   @invite = Invite.last

   @guest = User.find_by_email(@invite.email)
   
   if @guest

      @guest.id = @invite.guest_id

      @invite.save 

    end


 end



 def check_user_existence
    @user = User.find_by_email(email)
   if @user
     self.guest_id = @user.id
   end
 end
 
end
