class Notification < ApplicationRecord


	    #belongs_to :host, class_name: 'User',  optional: true
		#belongs_to :guest, class_name: 'User',  optional: true  
		belongs_to :invite 
		belongs_to :group 
		belongs_to :visitor
		belongs_to :user



		
end
