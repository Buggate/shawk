class AlterReservations < ActiveRecord::Migration[5.0]

  def change

  	remove_column :reservations, :guest_id

  	add_column :reservations, :visitor_id
  end
end
