class GistsController < ApplicationController


  before_action :find_party


  def index
     
     @gist = @party.gists

  end

  #def new


   # @gist = current_user.gists.build(:user_id => current_user.id)


  #end


  def create

     @gist = @party.gists.build(gist_params) 
   


     if @gist.save

     

  
  	  redirect_to profiles_path(@profile)

    else

    end

  end


  #def destroy
    

   # @gist = @profile.gists.find(params[:id])
  #  @gist.destroy


   # redirect_to profile_path(@profile)

 # end




  private

  def gist_params

    params.require(:gist).permit(:caption, :image, :visitor_id, :party_id)

  end

  def find_profile

      if params[:profile_id]

         @profile = Profile.find(params[:profile_id])

      end
  end



end


 
 