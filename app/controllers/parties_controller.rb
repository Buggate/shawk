class PartiesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  	 def index

          @parties = current_user.parties

         
    end


    def show

       @party  = Party.find(params[:id])
      
    end

    
    def new
      
    	   
     
    end

    
    def create
      
      
    	@party = current_user.parties.build(party_params)
      
     

    	  if @party.save
    	  	redirect_to @party
    	  else
    	  	render 'new'
    	  end
     
    end


    def edit

      @party = Party.find(params[:id])
      
    end
    


    def update

      @party = Party.find(params[:id])

      if @party.update_attributes(party_params)
        flash[:notice] = "Party updated successfully."
        redirect_to(:action => 'show', :id => @party.id, :user_id => current_user.id)
      else
        render('edit')

      end

    end

  
    def destroy
     
      @party = Party.find(params[:id])
      @party.destroy

      redirect_to root_path

     
    end

   private

    def party_params

      params.require(:party).permit(:title, :venue, :user_id, :picture)

    end
    
end
