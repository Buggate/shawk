module ReservationsHelper


	def checked(area)

		@reservation.rsvp.nil? ? false : @reservation.rsvp.match(area)
       
       #self.rsvp.nil? ? self.rsvp.accept : self.rsvp.decline(area)

     end

end
