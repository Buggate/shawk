class InvitesController < ApplicationController

	

    before_action :authenticate_user!

      before_action :find_group

      attr_accessor :placeholder, :password, 


  



 def index
   


   

 end



 



 def new








  

    @invite = @group.invites.build({:group_id => @group.id})
   

 end 


def create




    @invite = @group.invites.build(invite_params)


   

   

    @placeholder = "placeholder text"

   
   if  @invite.save



          if @invite.guest != nil

            
              create_visitor @invite, @group, @user

               create_notification @invite, @group, @visitor, @user
              

               InviteMailer.existing_user_invite(@invite, visitor_url(:id => @invite.visitor.id, :group_id => @invite.group.id)).deliver_now


               
         
               flash[:notice] = "Invitation Sent successfully."
               redirect_to(:action => 'index', :group_id => @group.id)
       
          else


        
               InviteMailer.guest_invite(@invite, new_user_registration_url(:invite_token => @invite.token, :email => @invite.email, :password => @placeholder )).deliver_now 

                


               flash[:notice] = "Invitation Sent successfully."
               redirect_to(:action => 'index', :group_id => @group.id)
       
        
          end
    
    else
      

        render 'new'


    end 

end



 private

  def invite_params

    params.require(:invite).permit(:email, :token, :group_id, :host_id, :guest_id)

  end

  def find_group
      if params[:group_id]
         @group = Group.find(params[:group_id])
      end
  end
  


  def create_notification(invite, group, visitor, user)  
    
       Notification.create(invite_id: invite.id,
                           group_id: invite.group.id,
                           visitor_id: invite.visitor.id,
                           user_id: invite.guest.id)
end  


  

 




end
