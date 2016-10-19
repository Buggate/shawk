class VisitorsController < ApplicationController

     before_action :authenticate_user!, except: [:index, :show]

    def index
      


      
      @visitors = current_user.visitors

    end


	def show

		@visitor = Visitor.find(params[:id])

		@invite = @visitor.invite


		@reservation = Reservation.all
	end







	


end
