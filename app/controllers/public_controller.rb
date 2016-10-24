class PublicController < ApplicationController







  layout 'general'


  def home

  end

  def index


    
    @profile = current_user.profile
 
  	


  end

end
