class Reservation < ApplicationRecord


	#before_save :find_rsvp
    #before_save :checked

   # attr_accessor :area

    #def initialize(options={})

    # @area = ['Accept', 'Decline']

   #end


       
  

    #before_save :check_accept


    before_save do

        self.rsvp.gsub!(/[\[\]\"]/, "") if attribute_present?("rsvp")

      end

	    belongs_to :group
	
      belongs_to :visitor

  

     
    #scope :accept, lambda { where(:confirm_type => 'Accept with grace') }
    #scope :decline, lambda { where(:confirm_type => 'Decline with regards') }

    private


    def check_accept
     
     @reservation.confirm_type = ['Accept with grace, Decline with regards']

      if @reservation.confirm_type == 'Accept with grace'
        @reservation.accept = true
      else
        @reservation.confirm_type == 'Decline with regards'
        @reservation.accept = false

      end 

    end

    def find_rsvp


       self.rsvp.gsub!(/[\[\]\"]/, "") if attribute_present?("rsvp")

     end

     def checked(area)
       
       self.rsvp.nil? ? self.rsvp.accept : self.rsvp.decline(area)

     end

end
