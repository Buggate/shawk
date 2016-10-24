class RegistrationsController < Devise::RegistrationsController


 def new

     build_resource({})

     @token = params[:invite_token]
     @email = params[:email]
     @password = params[:password]

   end



   def create

       @token = params[:invite_token]

      @newUser = User.create(user_params)


      if @newUser.save && @token != nil
   

          @invite = Invite.find_by_email(@newUser.email)

          @group = Invite.find_by_token(@token).group

           
           @invite.guest_id = @newUser.id 

                  @invite.save 

                  create_visitor @user, @group, @invite

                  redirect_to visitor_path(:id => @visitor.id, :group_id => @group.id)


          else

            @newUser

             set_flash_message :notice, :signed_up if is_navigational_format?
              sign_in(@newUser)
              respond_with @newUser, :location => after_sign_up_path_for(@newUser)


          end  

         
           
             



   

end



    def create_notification(invite, group, visitor)  
      
      Notification.create(invite_id: @visitor.invite.id,
                          group_id: @visitor.group.id,
                          visitor_id: @visitor.id)
  end  



 private

  def user_params

    params.require(:user).permit(:name, :email, :password)

  end









end
