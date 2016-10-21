Rails.application.routes.draw do




  
  devise_for :users, :controllers => { :registrations => "registrations" }

  

  resources :notifications, only: :index

   get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through



 
  resources :parties do

  resources :gists

end

  resources :profiles 

  resources :groups do

    resources :comments

  end

   
        
      
  
  resources :visitors do 

    resources :comments 

    resources :gists

  end

  resources :reservations




  

  resources :invites

  




  root 'public#home'

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


 

            
