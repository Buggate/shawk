class ProfilesController < ApplicationController

    before_action :authenticate_user!

    layout 'profile', only: [:index]


    def index

     @profile = current_user.profile

   

    end



       def show

        @profile = current_user.profile



       end

      	 def edit

            @profile = Profile.find(params[:id])

            
            
          end
          


          def update

           @profile = Profile.find(params[:id])

            if @profile.update_attributes(profile_params)
              flash[:notice] = "Profile updated successfully."
              redirect_to @profile
                    else

              render('edit')

            end

          end

    private

    def profile_params
     
         params.require(:profile).permit(:name, :username, :image, :bio, :user_id)

    end


end
