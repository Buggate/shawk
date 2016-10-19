class InviteMailer < ApplicationMailer


	default from: 'invitations@kburd.com'


	def existing_user_invite(invite, visitor_url)


      @invite = invite

   
      @visitor_url = visitor_url(:id => @invite.visitor.id, :group_id => @invite.visitor.group.id )

         
      @url = 'http://kburd.com'


      mail(to: @invite.email, subject: 'You are Invited to my Party')


    end

 
    def guest_invite(invite, new_user_registration_url)


      @invite = invite

      @new_user_registration_url = new_user_registration_url

      

      @url = 'http://kburd.com'


      mail(to: @invite.email, subject: 'You are Invited to my Party')


    end



    


end

