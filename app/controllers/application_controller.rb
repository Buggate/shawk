class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters

            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
            
        end


        def create_visitor(user, group, invite)  
    
             @visitor = @group.visitors.build(group_id: @invite.group.id, user_id: @invite.guest.id, invite_id: @invite.id)

             @visitor.party_id = @visitor.group.party.id



              @visitor.save


                


         end  



end



  