class NotificationsController < ApplicationController

	
			def link_through  

			  @notification = Notification.find(params[:id])
			  @notification.update read: true
			  redirect_to profiles_path @notification.guest.profile

			end 

    def index

       @notifications = current_user.notifications
       
    end


      

      def show



		     @notification = Notification.find(params[:id])
		   
		     
    

      end

end
