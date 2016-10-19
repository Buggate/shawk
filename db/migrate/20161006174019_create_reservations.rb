class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|

    	t.string  :name
	    t.integer :group_id
	    t.integer :host_id
	    t.integer :guest_id
	    t.boolean :accept
	    t.string  :confirm_type
	    t.string  :rsvp      

        t.timestamps

    end
    
  end
end


    