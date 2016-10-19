class ReservationsController < ApplicationController


	 before_action :find_visitor



   def new 
     
      @reservation = @visitor.reservations.build(:group_id => @visitor.group.id) 

   end


    def create

      
      @reservation = @visitor.reservations.build(reservation_params)   


     if @reservation.save

        
  
  	  redirect_to visitor_path(:id => @visitor.id, :group_id => @visitor.group.id)

    else

    end

  end

  def destroy
    

    @reservation = @vistor.reservations.find(params[:id])
    @reservation.destroy


    redirect_to group_url(@visitor.group.id)

  end


  private

  def reservation_params

    params.require(:reservation).permit(:name, :visitor_id, :group_id, rsvp:[])

  end

  def find_visitor

      if params[:visitor_id]

         @visitor = Visitor.find(params[:visitor_id])

      end
  

  end

  
end
