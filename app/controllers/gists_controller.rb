class GistsController < ApplicationController


  before_action :find_party

  before_action :find_visitor


 def create

    if @party != nil

       @gist = @party.gists.build(gist_params) 
   
        @gist.save

        redirect_to party_path(@party)

     else @visitor

       @gist = @visitor.gists.build(gist_params)

        @gist.save    

        redirect_to visitor_gists_path(:visitor_id => @visitor.id) 

    end

  end

  #def destroy
    

   # @gist = @profile.gists.find(params[:id])
  #  @gist.destroy


   # redirect_to profile_path(@profile)

 # end




  private

  def gist_params

    params.require(:gist).permit(:caption, :image, :owner, :visitor_id, :party_id)

  end

  def find_party

      if params[:party_id]

         @party = Party.find(params[:party_id])

      end
  end


  def find_visitor

      if params[:visitor_id]

         @visitor = Visitor.find(params[:visitor_id])

      end
  end



end


 
 