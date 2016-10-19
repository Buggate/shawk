class PublicController < ApplicationController







  layout 'public'


  def home

  end

  def index


    
    @profile = current_user.profile
 
  	


  end

end
