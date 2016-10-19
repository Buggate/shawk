class GroupsController < ApplicationController




  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_party




   def index
     
     @groups = @party.groups


   end

   def show 


     @group = Group.find(params[:id])
    
         
   end


  
  def new

    @group = @party.groups.build({:party_id => @party.id})
   
    

 

    
  end

  def create
    
    
    @group = @party.groups.build(group_params)
  
    
   

      if @group.save
        flash[:notice] = "Group created successfully."
        redirect_to(:action => 'index', :party_id => @party.id)
       
      else
        
        @party = @party.user.parties
        render 'new'
      end
   
  end
 


  def edit

   @group = Group.find(params[:id])
   

    
    
  end
  


  def update

    @group = Group.find(params[:id])

    if @group.update_attributes(group_params)

      flash[:notice] = "Group updated successfully."

      redirect_to @groups

    else
     @party = @party.user.parties
      render('edit')

    end

  end


  def destroy
   
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to root_path

   
  end


 private

  def group_params

    params.require(:group).permit(:name, :party_id)

  end

  def find_party
      if params[:party_id]
         @party = Party.find(params[:party_id])
      end
  end







end
